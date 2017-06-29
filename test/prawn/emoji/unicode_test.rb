# frozen_string_literal: true

require 'test_helper'

describe Prawn::Emoji::Unicode do
  let(:klass) { Prawn::Emoji::Unicode }

  describe '#==' do
    it { klass.new('🐟').must_be :==, klass.new('🐟') }
    it { klass.new('🐟').wont_be :==, klass.new('🍣') }
  end

  describe '#codepoint' do
    it { klass.new('🍣').codepoint.must_equal '1f363' }
    it { klass.new('🇯🇵').codepoint.must_equal '1f1ef-1f1f5' }
  end

  describe '#to_s' do
    it { klass.new('🍣').to_s.must_equal '🍣' }
    it { klass.new('❤️').to_s.wont_match /[\ufe0e\ufe0f]/ }
  end

  describe '#text?' do
    it 'has no selector' do
      klass.new('☀').wont_be :text?
    end

    it 'has text presentation selector' do
      klass.new('☀︎').must_be :text?
    end

    it 'has emoji presentation selector' do
      klass.new('☀️').wont_be :text?
    end
  end
end
