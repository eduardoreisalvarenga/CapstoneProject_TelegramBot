require_relative '../bin/main.rb'
require pp

describe Main do
  it 'starts my program' do
    expect(Main.new.main_method("jashdsiahd")).to raise_error
  end
end
