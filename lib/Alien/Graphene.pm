package Alien::Graphene;
# ABSTRACT: Alien package for the Graphene graphics math library

use strict;
use warnings;

use base qw( Alien::Base );
use Role::Tiny::With qw( with );

with 'Alien::Role::Dino';

use File::Spec;

=classmethod gi_typelib_path

A path for using with L<Glib::Object::Introspection> to load the typelib
needed.

  use Env qw(@GI_TYPELIB_PATH);
  push @GI_TYPELIB_PATH, Alien::Graphene->gi_typelib_path;

=cut
sub gi_typelib_path {
	my ($class) = @_;
	$class->install_type eq 'share'
		? ( File::Spec->catfile( $class->dist_dir, qw(lib girepository-1.0) ) )
		: ();
}

=classmethod pkg_config_path

A path for using with L<ExtUtils::PkgConfig> to load the typelib
needed.

  use Env qw(@PKG_CONFIG_PATH);
  push @PKG_CONFIG_PATH, Alien::Graphene->pkg_config_path;
  my %pkg = ExtUtils::PkgConfig->find('graphene-gobject-1.0');

=cut
sub pkg_config_path {
	my ($class) = @_;
	$class->install_type eq 'share'
		? ( File::Spec->catfile($class->dist_dir, qw(lib pkgconfig)) )
		: ();
}

1;
__END__
=head1 SEE ALSO

L<Graphene|http://ebassi.github.com/graphene>

L<Repository information|http://project-renard.github.io/doc/development/repo/p5-Alien-Graphene/>
