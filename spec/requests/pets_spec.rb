# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'pets', type: :request do
  path '/pets' do
    get 'Lista de perros' do
      tags 'Perros'
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

      response '200', 'Lista de perros' do
        header 'Per-page', type: 'integer', description: 'Total de elementos por página'
        header 'Total', type: 'integer', description: 'Total de elementos'
        schema type: 'array', items: { '$ref': '#/components/schemas/pet'}
        run_test!
      end
    end
  end

  path '/pets/{id}' do
    get 'Detalle del perro' do
      tags 'Perros'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: []]

      response '200', 'Perro encontrado' do
        schema '$ref' => '#/components/schemas/pet'
        run_test!
      end

      response '404', 'Perro no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end

  path '/pets' do
    post 'Crear perro' do
      tags 'Perros'
      consumes 'multipart/form-data'
      parameter name: :pet, in: :body, schema: {
        type: :object,
        properties: {
          'pet[name]': { type: :string, description: 'Nombre ' },
          'pet[race]': { type: :string, description: 'Raza' },
          'pet[gender]': { type: :string, description: 'Sexo' },
          'pet[color]': { type: :string, description: 'Color' },
          'pet[sterilized]': { type: :boolean, description: 'Esterilizado?' },
          'pet[size]': { type: :string, description: 'Tamaño' },
          'pet[image]': { type: :string, format: 'binary', description: 'Imágen del perro' },
          'pet[adoption_status]': { type: :boolean, description: 'Adoptado?' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Perro creada' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/pet' }
               }
        run_test!
      end

      response '422', 'Error al crear Perro' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end
    end
  end

  path '/pets/{id}' do
    patch 'Actualizar Perro' do
      tags 'Perros'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :pet, in: :body, schema: {
        type: :object,
        properties: {
          'pet[name]': { type: :string, description: 'Nombre ' },
          'pet[race]': { type: :string, description: 'Raza' },
          'pet[gender]': { type: :string, description: 'Sexo' },
          'pet[color]': { type: :string, description: 'Color' },
          'pet[sterilized]': { type: :boolean, description: 'Esterilizado?' },
          'pet[size]': { type: :string, description: 'Tamaño' },
          'pet[image]': { type: :string, format: 'binary', description: 'Imágen del perro' },
          'pet[adoption_status]': { type: :boolean, description: 'Adoptado?' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Perro actualizado' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/pet' }
               }
        run_test!
      end

      response '422', 'Error al actualizar perro' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end

      response '404', 'Perro no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
end
