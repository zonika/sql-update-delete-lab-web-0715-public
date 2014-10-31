describe "updating and deleting data" do
  before do
    @db = SQLite3::Database.new(':memory:')
    SQLRunner.make_methods
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_sql_create
    @sql_runner.execute_sql_insert
  end

  context 'updating data' do 
    before do 
      @sql_runner.execute_sql_update
    end

    it "updates Maru's age to 7" do 
      sql = <<-SQL 
      SELECT age FROM cats WHERE name="Maru";
      SQL
      expect(@db.execute(sql)).to eq([[7]])
    end

    it "updates Nala to declawed" do 
      sql = <<-SQL 
      SELECT declawed FROM cats WHERE name="Nala";
      SQL
      expect(@db.execute(sql)).to eq([[1]])
    end
  end

  context 'deleting data' do 
    before do 
      @sql_runner.execute_sql_delete
    end

    it 'deletes Nala from the table' do 
      sql = <<-SQL 
      SELECT name FROM cats WHERE name="Nala";
      SQL
      expect(@db.execute(sql)).to eq([])
    end
  end
end