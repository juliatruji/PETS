# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'logins', type: :request do
  path '/logins' do
    post 'Login' do
      tags 'Login'
      consumes 'multipart/form-data'
      parameter in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, description: 'Correo Electrónico' },
          password: { type: :string, format: :password, description: 'Contraseña' },
        },
        required: ['email', 'password']
      }

      produces 'application/json'

      response '200', 'Autenticación correcta' do
        schema type: 'object',
               properties: {
                 token_type: { type: 'string' },
                 access_token: { type: 'string' }
               }
        run_test!
      end
    end
  end
end
