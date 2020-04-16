# frozen_string_literal: true

RSpec.describe Senro::QueryParamsFormatter do
  describe '#sort' do
    context 'with +' do
      it 'returns order clause containing ASC' do
        expect(Senro::QueryParamsFormatter.sort('+id')).to eq({ id: 'asc' })
      end
    end

    context 'with -' do
      it 'returns order clause containing DESC' do
        expect(Senro::QueryParamsFormatter.sort('-id')).to eq({ id: 'desc' })
      end
    end

    context 'without + and -' do
      it 'returns order clause containing ASC' do
        expect(Senro::QueryParamsFormatter.sort('id')).to eq({ id: 'asc' })
      end
    end

    context 'with multiple attributes' do
      it 'returns correct order clause' do
        expect(
          Senro::QueryParamsFormatter.sort('+id,+name,created_at,-updated_at')
        ).to eq({ id: 'asc', name: 'asc', created_at: 'asc', updated_at: 'desc' })
      end
    end

    context 'with camel case attributes' do
      it 'returns snake case attributes' do
        expect(
          Senro::QueryParamsFormatter.sort('+id,+name,createdAt,-updatedAt')
        ).to eq({ id: 'asc', name: 'asc', created_at: 'asc', updated_at: 'desc' })
      end
    end
  end
end
