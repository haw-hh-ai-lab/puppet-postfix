require 'spec_helper'

describe 'postfix::rule', :type => :define do
  let(:facts) { {:operatingsystem => 'Debian', :operatingsystemrelease => '7.1'} }
  let(:title) { 'a_new_rule' }
  let(:params) { {
    :rule          => 'the_data_to_set'
  } }
  it 'should have an augeas resource' do
    should contain_augeas('postfix main.cf a_new_rule')
  end
  describe_augeas 'postfix main.cf a_new_rule', :lens => 'postfix_main', :target => 'etc/postfix/main.cf' do
    it 'a_new_rule should be set to the_data_to_set' do
      should execute.with_change

      aug_get('a_new_rule').should == 'the_data_to_set' 

      should execute.idempotently
    end
  end
end

