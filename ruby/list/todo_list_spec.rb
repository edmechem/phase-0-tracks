class TodoList
  @list = []
  def initialize(array)
    @list = array
  end

  def get_items
    @list
  end

  def add_item(string)
    @list << string
  end

  def delete_item(string)
    @list.delete(string)
  end

  def get_item(int)
    @list.fetch(int)
  end
end

describe TodoList do
  let(:list) { TodoList.new(["do the dishes", "mow the lawn"]) }

  it "initializes with two items" do
    expect(list.get_items).to eq ["do the dishes", "mow the lawn"]
  end

  it "adds an item to the list" do
    list.add_item("mop")
    expect(list.get_items).to eq ["do the dishes", "mow the lawn", "mop"]
  end

  it "deletes an item" do
    list.delete_item("do the dishes")
    expect(list.get_items).to eq ["mow the lawn"]
  end

  it "retrieves an item by index" do
    expect(list.get_item(0)).to eq "do the dishes"
    expect(list.get_item(1)).to eq "mow the lawn"
  end
end
