require 'hash_initializer'

RSpec.describe HashInitializer do
  it "has a version number" do
    expect(HashInitializer::VERSION).not_to be nil
  end

  let(:klass) { ValidKlass }
  let(:attribute) { raise('you need define variable `attribute`.') }

  describe :new do
    context :arguments_is_hash do
      let(:attribute) { {a: 'a', b: 'b'} }
      let(:actual) { klass.new(attribute) }
      it :should_nothing_raise do
        expect(actual).to be_instance_of(klass)
      end
    end

    context :arguments_is_not_hash do
      let(:attribute) { [] }
      let(:actual) { klass.new(attribute) }
      let(:err_klass) { ArgumentError }
      let(:err_msg) { 'Array is not allow, argument should be Hash.' }
      it :should_raise do
        expect {  klass.new(attribute) }.to raise_error(err_klass, )
      end
    end
  end
end

class ValidKlass; include HashInitializer; end
