class User < ActiveRecord::Base
  after_save :create_db_record, on: :create
  after_create :account_progress, :send_welcome_mail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook,:linkedin]
  validates :email, uniqueness: true

  has_many :companies, dependent: :destroy
  has_many :user_provider, dependent: :destroy
  has_many :jobs, through: :companies
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :certificates, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_one :driving_license, dependent: :destroy
  has_one :user_job_category, dependent: :destroy
  has_one :user_job_type, dependent: :destroy
  has_many :user_competences , dependent: :destroy
  has_many :competences, through: :user_competences
  has_many :saved_jobs, dependent: :destroy
  has_many :job_applications, dependent: :destroy
  has_many :hobbies, dependent: :destroy
  mount_uploader :image_url, ImageUploader

  # overwrite uploader url method so you can use format in views
  # for example: @post.video.url(:mp4)

  mount_uploader :video_url, VideoUploader
=begin do
      def url(format = nil)
          uploaded_path = encode_path(file.path.sub(File.expand_path(root), ''))
          return uploaded_path if format.nil?
          files = Dir.entries(File.dirname(file.path))
          files.each do |f|
              next unless File.extname(f) == '.' + format.to_s
              return File.dirname(uploaded_path) + '/' + f
          end
      end
  end
=end



  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.name = auth.info.name
          user.uid = auth.uid
          user.email = auth.info.email
          user.image_url = auth.info.image
          user.password = Devise.friendly_token[0,20]
      end
  end

  def send_welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end
  def create_db_record
    DrivingLicense.create(user_id: self.id)
  end
  def account_progress
    self.user_account_progress = 10
    self.user_company_progress = 0
    self.user_company_progress = 0
    self.save!
  end
end
