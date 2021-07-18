# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'veterinary_appointments', type: :request do
  path '/veterinary_appointments' do
    get 'Lista de citas al veterinario' do
      tags 'Citas al veterinario'
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

      response '200', 'Lista de citas al veterinario' do
        header 'Per-page', type: 'integer', description: 'Total de elementos por página'
        header 'Total', type: 'integer', description: 'Total de elementos'
        schema type: 'array', items: { '$ref': '#/components/schemas/veterinary_appointment' }
        run_test!
      end
    end
  end

  path '/veterinary_appointments/{id}' do
    get 'Detalle de la cita al veterinario' do
      tags 'Citas al veterinario'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      security [bearerAuth: []]

      response '200', 'Cita al veterinario encontrado' do
        schema '$ref' => '#/components/schemas/veterinary_appointment'
        run_test!
      end

      response '404', 'Cita al veterinario no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end

  path '/veterinary_appointments' do
    post 'Crear cita al veterinario' do
      tags 'Citas al veterinario'
      consumes 'multipart/form-data'
      parameter name: :veterinary_appointment, in: :body, schema: {
        type: :object,
        properties: {
          'veterinary_appointment[image]': { type: :string, format: 'binary', description: 'Imágen de cita' },
          'veterinary_appointment[control_type]': { type: :string, description: 'Tipo de cita' },
          'veterinary_appointment[pet_id]': { type: :integer, description: 'ID del perro' },
          'veterinary_appointment[date]': { type: :date, description: 'Fecha de la cita' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Cita veterinaria creada' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/veterinary_appointment' }
               }
        run_test!
      end

      response '422', 'Error al crear Cita al veterinario' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end
    end
  end

  path '/veterinary_appointments/{id}' do
    patch 'Actualizar Cita al veterinario' do
      tags 'Citas al veterinario'
      parameter name: :id, in: :path, type: :string
      consumes 'multipart/form-data'
      parameter name: :veterinary_appointment, in: :body, schema: {
        type: :object,
        properties: {
          'veterinary_appointment[image]': { type: :string, format: 'binary', description: 'Imágen de cita' },
          'veterinary_appointment[control_type]': { type: :string, description: 'Tipo de cita' },
          'veterinary_appointment[pet_id]': { type: :integer, description: 'ID del perro' },
          'veterinary_appointment[date]': { type: :date, description: 'Fecha de la cita' }
        }
      }
      security [bearerAuth: []]

      response '200', 'Cita al vetrinario actualizado' do
        schema type: :object,
               properties: {
                 status: { type: :string, description: 'Estado' },
                 message: { type: :string, description: 'Mensaje o descripción' },
                 data: { '$ref' => '#/components/schemas/veterinary_appointment' }
               }
        run_test!
      end

      response '422', 'Error al actualizar la cita al veterinario' do
        schema '$ref' => '#/components/schemas/unprocessable_entity'
        run_test!
      end

      response '404', 'Cita al veterinario no encontrado' do
        schema '$ref' => '#/components/schemas/not_found'
        run_test!
      end
    end
  end
end
