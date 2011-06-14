Sequel.migration do
  up do
    alter_table :items do
      add_column :sku, String, :null => false
    end
  end
end

