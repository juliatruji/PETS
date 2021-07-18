module VeterinaryAppointmentSchema
    OBJECT = {
      type: 'object',
      properties: {
        id: { type: 'integer', description: 'ID de la cita al veterinario' },
        image: { type: 'string', description: 'Imágen de la cita' },
        control_type: { type: 'string', description: 'Tipo de cita' },
        date: { type: 'string', description: 'Tipo de cita' },
        created_at: { type: :string, format: 'date-time', description: 'Fecha de creación' },
        updated_at: { type: :string, format: 'date-time', description: 'Fecha de actualización' },
        pet: { '$ref': '#/components/schemas/pet' }
      },
      required: [:id]
    }.freeze
end