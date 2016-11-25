class UserProvider < ActiveRecord::Base
  belongs_to :user

  def self.find_for_oauth(auth)

      user = UserProvider.where(:provider => auth.provider, :uid => auth.uid).first
      unless user.nil?
          user.user
      else
          registered_user = User.where(:email => auth.info.email).first
          unless registered_user.nil?
              UserProvider.create!(
                      provider: auth.provider,
                      uid: auth.uid,
                      user_id: registered_user.id
              )
              registered_user
          else
              user =
              if auth.provider == 'facebook'
                      User.create!(
                      email: auth.info.email,
                      name: auth.info.name,
                      remote_image_url_url: auth.info.image,
                      password: Devise.friendly_token[0,20])
              else
                  User.create!(
                          email: auth.info.email,
                          name: auth.info.name,
                          remote_image_url_url: auth[:extra][:raw_info][:pictureUrls][:values].first,
                          password: Devise.friendly_token[0,20])
              end
              user_provider = UserProvider.create!(
                      provider:auth.provider,
                      uid:auth.uid,
                      user_id: user.id
              )
              user
          end
      end
  end
end
