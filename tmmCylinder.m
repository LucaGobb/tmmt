function [A, B, C, D] = tmmCylinder( k, L, r, Zc, cst )
% TMMCYLINDER:  Compute the transfer-matrix coefficients for a cylindrical section.
%
% [A B C D] = TMMCYLINDER(K, L, R, ZC, CST) returns the coefficients of the
% transfer matrix describing a 1D cylindrical waveguide section. K is a 1D
% vector of wave numbers (frequencies) at which the coefficients are
% computed, L is the section length, R is the section radius, and ZC is the
% real characteristic impedance of the section. The optional parameter CST,
% which is a constant that depends on the properties of air, is used to
% apply thermo-viscous losses. The returned values are vectors of the same
% dimension as K.
%
% by Gary P. Scavone, McGill University, 2013-2021.

if ~isvector(k)
  error( 'k should be a 1D vector.' );
end

Gamma = 1j*k;
if ( nargin == 5 )
  % Include losses
  Gamma = Gamma + (1+1j) * cst .* sqrt(k) / r;
end

sinhL = sinh( L * Gamma );
coshL = cosh( L * Gamma );
A = coshL;
B = Zc * sinhL;
C = sinhL / Zc;
D = A;

