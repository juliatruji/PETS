# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'admins', type: :request do
  path '/admins' do
    get 'Lista de administradores' do
      tags 'Admin'
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'Lista de administradores' do
        header 'Per-page', type: 'integer', description: 'Total de elementos por página'
        header 'Total', type: 'integer', description: 'Total de elementos'
        schema type: 'array', items: { '$ref': '#/components/schemas/admin'}
        run_test!
      end
    end
  end

  path '/admins/{id}' do
    get 'Detalle del administrador' do
      tags 'Admin'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: []]

      response '200', 'Admin encontrado' do
        schema '$ref' => '#/components/schemas/admin'
        run_test!
      end

      response '404', 'Admin no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
end
