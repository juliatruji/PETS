# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'adopters', type: :request do
  path '/adopters' do
    get 'Lista de adoptantes' do
      tags 'Adoptantes'
      parameter name: :q, in: :query, type: :string, description: 'Búsqueda por coicidencia'
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

      response '200', 'Lista de adoptantes' do
        header 'Per-page', type: 'integer', description: 'Total de elementos por página'
        header 'Total', type: 'integer', description: 'Total de elementos'
        schema type: 'array', items: { '$ref': '#/components/schemas/adopter'}
        run_test!
      end
    end
  end

  path '/adopters/{id}' do
    get 'Detalle del adoptante' do
      tags 'Adoptantes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: []]

      response '200', 'Adoptante encontrado' do
        schema '$ref' => '#/components/schemas/adopter'
        run_test!
      end

      response '404', 'Adoptante no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end

  path '/adopters' do
    post 'Crear adoptante' do
      tags 'Adoptantes'
      consumes 'multipart/form-data'
      parameter name: :adopter, in: :body, schema: {
        type: :object,
        properties: {
          'adopter[name]': { type: :string, description: 'Nombre ' },
          'adopter[dni]': { type: :string, description: 'Dni' },
          'adopter[address]': { type: :string, description: 'Dirección' },
          'adopter[cel]': { type: :string, description: 'Celular' },
          'adopter[age]': { type: :integer, description: 'Edad' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Adoptante creada' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/adopter' }
               }
        run_test!
      end

      response '422', 'Error al crear Adoptante' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end
    end
  end

  path '/adopters/{id}' do
    patch 'Actualizar Adoptante' do
      tags 'Adoptantes'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter in: :body, schema: {
        type: :object,
        properties: {
          adopter: {
            type: :object,
            properties: {
              name: { type: :string, description: 'Nombre' },
              dni: { type: :string, description: 'Dni' },
              address: { type: :string, description: 'Direccion' },
              cel: { type: :string, description: 'cel' },
              age: { type: :integer, description: 'Edad' }
            }
          }
        }
      }
      security [bearerAuth: []]

      response '200', 'Adoptante actualizado' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/adopter' }
               }
        run_test!
      end

      response '422', 'Error al actualizar adoptante' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end

      response '404', 'Adoptante no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
  path '/adopters/{id}' do
    delete 'Eliminar Adoptante' do
      tags 'Adoptantes'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'
      security [bearerAuth: []]

      response '200', 'Adopter eliminado' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/adopter' }
               }
        run_test!
      end

      response '422', 'Error al eliminar Adopter' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end

      response '404', 'Adopter no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
end
