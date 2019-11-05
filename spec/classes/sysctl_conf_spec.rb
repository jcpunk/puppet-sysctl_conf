require 'spec_helper'

describe 'sysctl_conf' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end

  context 'with given config' do
    let(:params) do
      {
        :values => {
          'vm.overcommit_memory' => {
            :value => '1'
          },
          'vm.overcommit_ratio' => {
            :value => '80'
          }
        }
      }
    end

    it { is_expected.to contain_sysctl('vm.overcommit_memory').with(
      :value  => '1',
      :ensure   => 'present'
    ) }

    it { is_expected.to contain_sysctl('vm.overcommit_ratio').with(
      :value  => '80',
      :ensure   => 'present'
    ) }
  end


end
