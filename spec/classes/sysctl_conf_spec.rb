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
        values: {
          'vm.overcommit_memory' => {
            value: '1',
          },
          'vm.overcommit_ratio' => {
            value: '80',
          },
        },
      }
    end

    it {
      is_expected.to contain_sysctl('vm.overcommit_memory').with(
        value: '1',
        ensure: 'present',
      )
    }

    it {
      is_expected.to contain_sysctl_conf__entry('vm.overcommit_memory').with(
        value: '1',
        ensure: 'present',
      )
    }

    it {
      is_expected.to contain_sysctl('vm.overcommit_ratio').with(
        value: '80',
        ensure: 'present',
      )
    }

    it {
      is_expected.to contain_sysctl_conf__entry('vm.overcommit_ratio').with(
        value: '80',
        ensure: 'present',
      )
    }
  end

  context 'allow passing other types than string' do
    let(:params) do
      {
        values: {
          'vm.overcommit_memory': {
            value: 1,
          },
        },
      }
    end

    it 'accepts integer' do
      is_expected.to contain_sysctl('vm.overcommit_memory').with(
        value: 1,
        ensure: 'present',
      )
    end
  end

  context 'with full options' do
    let(:params) do
      {
        values: {
          'net.ipv4.ip_local_port_range' => {
            value: '15000 61000',
            target: '/etc/sysctl.d/ip_local_port_range.conf',
            apply: false,
            persist: true,
            comment: 'foo',
            silent: true,
          },
        },
      }
    end

    it {
      is_expected.to contain_sysctl('net.ipv4.ip_local_port_range').with(
        ensure: 'present',
        value: '15000 61000',
        target: '/etc/sysctl.d/ip_local_port_range.conf',
        apply: false,
        persist: true,
        comment: 'foo',
        silent: true,
      )
    }

    it {
      is_expected.to contain_sysctl_conf__entry('net.ipv4.ip_local_port_range').with(
        ensure: 'present',
        value: '15000 61000',
        target: '/etc/sysctl.d/ip_local_port_range.conf',
        apply: false,
        persist: true,
        comment: 'foo',
        silent: true,
      )
    }
  end
end
