# frozen_string_literal: true

RSpec.describe Senro::QueryParamsFormatter do
  describe '#query' do
    context 'with query' do
      it 'returns a query' do
        expect(Senro::QueryParamsFormatter.query('senro gem')).to eq({
          query: 'senro gem',
          status: {}
        })
      end
    end

    context 'without query' do
      it 'returns a empty hash' do
        expect(Senro::QueryParamsFormatter.query(nil)).to eq({
          query: '',
          status: {}
        })
      end
    end

    context 'with status' do
      context 'with single status' do
        it 'returns a status' do
          expect(Senro::QueryParamsFormatter.query('is:open')).to eq({
            query: '',
            status: { is: ['open'] }
          })
        end
      end

      context 'with datetime status' do
        it 'returns a datetime status' do
          expect(Senro::QueryParamsFormatter.query('from:2020-01-01T10:00:00+09:00')).to eq({
            query: '',
            status: { from: ['2020-01-01T10:00:00+09:00'] }
          })
        end
      end

      context 'with multiple statuses' do
        it 'returns statuses' do
          expect(Senro::QueryParamsFormatter.query('is:open is:close')).to eq({
            query: '',
            status: { is: ['open', 'close'] }
          })
        end
        it 'returns statuses' do
          expect(Senro::QueryParamsFormatter.query('is:open is:close title:wip')).to eq({
            query: '',
            status: {
              is: ['open', 'close'],
              title: ['wip']
            }
          })
        end
      end
    end

    context 'with query and status' do
      it 'returns query and status' do
        expect(Senro::QueryParamsFormatter.query('is:open senro gem')).to eq({
          query: 'senro gem',
          status: { is: ['open'] }
        })
      end

      it 'returns query and status' do
        expect(Senro::QueryParamsFormatter.query('is:open senro gem is:close ruby version')).to eq({
          query: 'senro gem ruby version',
          status: { is: ['open', 'close'] }
        })
      end
    end
  end
end
