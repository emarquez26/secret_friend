class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:google_oauth2]

  	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
	    data = access_token.info
	    user = User.where(:email => data.email).first

	    unless user
	        user = User.create(name: data.name,
	           email: data.email,
	           password: Devise.friendly_token[0,20]
	        )
	    end
	    user
	end

	def self.users_available(id)
		where(relation: 'false').where.not(id: id)
	end

	def self.change_relation(my_id, secret_friend_id)
    change_relation = { my_id => { "relation" => "true" }, secret_friend_id => { "relation" => "true" } }
    update(change_relation.keys, change_relation.values)
  end
 #enviar correo para acceder a la aplicacion y tambien saber que amigo le toco(aun no completado)
  def self.enviarCorreo    
        @persona1 = User.create({ name: 'Edwin Marquez', email: 'emarquez26@misena.edu.co', like:'ded', dislike: 'jhjhjk', encrypted_password: 'a12345678',
        sign_in_count: 1 })    
        UserMailer.welcome_email(@persona1).deliver
        
  end
end
