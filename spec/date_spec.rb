# -*- coding: utf-8 -*-
require File.expand_path('../lib/era_ja/date', File.dirname(__FILE__))
require File.expand_path('spec_helper', File.dirname(__FILE__))

describe Date do
  describe "#to_era" do

    context "date is 2012,4,29" do
      subject { Date.new(2012,4,29) }
      include_examples "should equal 'H24.4.29'"
      include_examples "should equal '平成24.4.29'"
      include_examples "should equal '24.4.29'"
    end

    context "date is 1989,1,8" do
      subject { Date.new(1989,1,8) }

      include_examples "should equal 'H1.1.8'"
    end

    context "date is 1989,1,7" do
      subject { Date.new(1989,1,7) }
      include_examples "should equal 'S64.1.7'"
      include_examples "should equal '昭和64.1.7'"
    end

    context "date is 1926,12,25" do
      subject { Date.new(1926,12,25) }
      include_examples "should equal 'S1.12.25'"
    end

    context "date is 1926,12,24" do
      subject { Date.new(1926,12,24) }
      include_examples "should equal 'T15.12.24'"
    end

    context "date is 1912,7,30" do
      subject { Date.new(1912,7,30) }
      include_examples "should equal 'T1.7.30'"
      include_examples "should equal '大正1.7.30'"
    end

    context "date is 1912,7,29" do
      subject { Date.new(1912,7,29) }
      include_examples "should equal 'M45.7.29'"
      include_examples "should equal '明治45.7.29'"
    end

    context "date is 1868,9,8" do
      subject { Date.new(1868,9,8) }
      include_examples "should equal 'M1.9.8'"
    end

    context "date is 1868,9,7" do
      it { expect { Date.new(1868,9,7).to_era }.
        to raise_error(RuntimeError, "#to_era is expeted later in 1968,9,8") }
    end

  end

end
