class ConvertTablesToUtf8 < ActiveRecord::Migration
  def change
    # When MySQL converts a table to utf8 it also automatically converts all
    # text columns to mediumtext, because utf8 can use three times more space
    # per character so text wouldn't be long enough. We don't want that, so
    # find all text fields for conversion back to text afterwards.
    connection = ActiveRecord::Base.connection
    text_cols = {}
    connection.tables.each do |t|
      columns = connection.schema_cache.columns(t).select {|c| c.type == :text}
      text_cols[t] = columns if !columns.empty?
    end

    connection.tables.each do |t|
      puts "Converting table #{t}"
      connection.execute("ALTER TABLE #{t} CONVERT TO CHARACTER SET utf8")
    end
    text_cols.each do |t, cols|
      cols.each do |col|
        c = col.name
        puts "Modifying column #{c} for table #{t}"
        connection.execute("ALTER TABLE #{t} MODIFY COLUMN #{c} text")
      end
    end
    connection.execute("ALTER DATABASE #{connection.current_database} DEFAULT CHARACTER SET utf8")
  end
end
