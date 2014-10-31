describe "updating and deleting data" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_sql_create
    @sql_runner.execute_sql_insert
  end

  context 'updating data' do 
  end

  context 'deleting data' do 
  end
end