# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'adoptions', type: :request do
  path '/adoptions' do
    get 'Lista de adopciones' do
      tags 'Adopciones'
      parameter name: :from,
                in: :query,
                schema: { type: :string, format: :date },
                description: 'Rango: Fecha Inicial'
      parameter name: :to,
                in: :query,
                schema: { type: :string, format: :date },
                description: 'Rango: Fecha Final'
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'Lista de adopcciones' do
        header 'Per-page', type: 'integer', description: 'Total de elementos por página'
        header 'Total', type: 'integer', description: 'Total de elementos'
        schema type: 'array', items: { '$ref': '#/components/schemas/adoption'}
        run_test!
      end
    end
  end

  path '/adoptions/{id}' do
    get 'Detalle de la adopcion' do
      tags 'Adopciones'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: []]

      response '200', 'Adopcion encontrado' do
        schema '$ref' => '#/components/schemas/adoption'
        run_test!
      end

      response '404', 'Adopcion no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end

  path '/adoptions' do
    post 'Crear adopcion' do
      tags 'Adopciones'
      consumes 'multipart/form-data'
      parameter name: :adoption, in: :body, schema: {
        type: :object,
        properties: {
          'adoption[date]': { type: :date, description: 'Fecha de adopcion ' },
          'adoption[pet_id]': { type: :integer, description: 'id perro' },
          'adoption[admin_id]': { type: :integer, description: 'id administrador' },
          'adoption[adopter_id]': { type: :integer, description: 'id adoptante' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Adopcion creada' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/adoption' }
               }
        run_test!
      end

      response '422', 'Error al crear adopcion' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end
    end
  end

  path '/adoptions/{id}' do
    patch 'Actualizar adopcion' do
      tags 'Adopciones'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter in: :body, schema: {
        type: :object,
        properties: {
          adoption: {
            type: :object,
            properties: {
              date: { type: :date, description: 'Fecha' },
              pet_id: { type: :integer, description: 'Id del perro' },
              admin_id: { type: :integer, description: 'id del administrador' },
              adopter_id: { type: :integer, description: 'id del adoptante' }
            }
          }
        }
      }
      security [bearerAuth: []]

      response '200', 'Adopcion actualizado' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/adoption' }
               }
        run_test!
      end

      response '422', 'Error al actualizar adopcion' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end

      response '404', 'adopcion no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
end
