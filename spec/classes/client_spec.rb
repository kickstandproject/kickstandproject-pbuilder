require 'spec_helper'

describe 'pbuilder::client' do
  context 'on Ubuntu 12.04 (Precise)' do
    let(:facts) { { 
      :lsbdistcodename  => 'precise',
      :lsbdistrelease   => '12.04',
      :operatingsystem  => 'Ubuntu',
    } }

    it do
      should contain_file('/etc/pbuilderrc').with({
        'ensure'  => 'file',
        'group'   => 'root',
        'mode'    => '0644',
        'owner'   => 'root',
      })
    end

    directories = [
      '/var/cache/pbuilder',
      '/var/cache/pbuilder/ccache',
      '/var/cache/pbuilder/hook.d',
    ]

    directories.each do |dirs|
      it do
        should contain_file(dirs).with({
          'ensure'  => 'directory',
          'group'   => 'root',
          'mode'    => '0644',
          'owner'   => 'root',
        })
      end
    end

    it do
      should contain_package('pbuilder').with_ensure('present')
    end
  end
end

# vim:sw=2:ts=2:expandtab
