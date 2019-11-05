require 'spec_helper'

describe 'sysctl_conf::entry' do
  let(:title) { 'net.ipv4.ip_forward' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end

  context 'present' do
    let(:params) do
      { value: '1' }
    end

    it {
      is_expected.to contain_sysctl('net.ipv4.ip_forward').with(
        value: '1',
        ensure: 'present',
      )
    }
  end

  context 'absent' do
    let(:params) do
      { ensure: 'absent' }
    end

    it { is_expected.to contain_sysctl('net.ipv4.ip_forward').with_ensure('absent') }
  end
end
