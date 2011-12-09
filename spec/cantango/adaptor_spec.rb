require 'spec_helper'
require 'fixtures/models'
require 'migration_helper'

class Poster < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
end

class Adaptation
  include CanTango::Adaptor
end

class GenericClazz
end

class ArClazz
end


describe CanTango::Adaptor do
  before do
    @post = Post.new
    @poster = Poster.new
    @generic_clazz = GenericClazz
    @ar_class = ArClazz
  end
  subject { Adaptation.new }
  
  describe 'matching_orm(obj)' do
    context 'Generic obj' do
      specify { subject.matching_orm(@post).should == nil }
    end

    context 'Active Record obj' do
      specify { subject.matching_orm(@poster).should == :active_record }
    end
  end

  describe 'orm_for(obj)' do
    context 'Generic obj' do
      specify { subject.orm_for(@post).should == :generic }
    end

    context 'Active Record obj' do
      specify { subject.orm_for(@poster).should == :active_record }
    end
  end

  describe 'adaptor_for(obj)' do
    context 'Generic obj' do
      specify { subject.adaptor_for(@post).should == CanTango::Adaptor::Generic }
    end

    context 'Active Record obj' do
      specify { subject.adaptor_for(@poster).should == CanTango::Adaptor::ActiveRecord }
    end
  end

  describe 'use_adaptor! base, object' do
    context 'Generic obj' do
      before do
        subject.use_adaptor!(@generic_clazz, @post)
      end
      specify { @generic_clazz.adaptor_type.should == :generic }
    end

    context 'Active Record obj' do
      before do
        subject.use_adaptor!(@ar_clazz, @poster)
      end
      specify { @ar_clazz.adaptor_type.should == :active_record }

    end
  end


  # def use_adaptor! base, object
  #   base.class.send :include, adaptor_for(object)
  # end


  # def use_adaptor! base, object
  #   base.class.send :include, adaptor_for(object)
  # end
  # 
  # def adaptor_for object
  #   "#{self.class}::#{orm_for(object).to_s.camelize}".constantize
  # end
  # 
  # def orm_for object
  #   matching_orm(object) || :generic
  # end
  # 
  # def matching_orm object

end
