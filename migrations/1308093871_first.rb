Sequel.migration do
  up do
    create_table :items do
      primary_key :id
      String :name, :null => false
      Float  :price, :null => false
    end
  end
end

