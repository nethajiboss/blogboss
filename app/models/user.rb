require 'digest'
class User < ActiveRecord::Base
  validates_presence_of :username
  attr_accessor :password
  validates :email, :uniqueness => true, :length => { :within => 5..50 }, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :password, :confirmation => true, :length => { :within => 4..20 }, :presence => true, :if => :password_required?
  has_one :profile
  has_many :articles, :order => 'published_at DESC, title ASC', :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments
  before_save :encrypt_new_password
  scope :user_article, joins(:articles => :comments)
  scope :right_out, joins('right outer join articles on users.id=articles.user_id').select("users.username,articles.title")
  scope:sql_inner, User.find_by_sql("SELECT * FROM users INNER JOIN articles ON users.id=articles.user_id")
  def self.authenticate(name, password)
    user = where("username = ? OR email = ?",name, name).first
    return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end
  
  def password_required?
    hashed_password.blank? || password.present?
  end
  
  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end