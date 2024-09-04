class User < ApplicationRecord
  # Devise modules para manejar la autenticación
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relación con el modelo `Application` (postulaciones)
  has_many :applications

  # Adjuntar una foto de perfil al usuario usando Active Storage
  has_one_attached :photo

  # Atributo admin para diferenciar administradores de usuarios normales
  attribute :admin, :boolean, default: false
end