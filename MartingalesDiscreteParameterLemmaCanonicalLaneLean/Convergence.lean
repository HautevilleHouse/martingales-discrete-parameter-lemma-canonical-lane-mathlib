import MartingalesDiscreteParameterLemmaCanonicalLaneLean.DoobInequality

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure ConvergencePackage {M : MartingaleAdmittedObject} {D : DoobInequalityPackage} where
  upcrossingInequality : Prop
  almostSureConvergence : Prop
  l1Convergence : Prop
  upcrossingInequalityClosed : upcrossingInequality
  almostSureConvergenceClosed : almostSureConvergence
  l1ConvergenceClosed : l1Convergence

structure ConvergenceEvidence {M : MartingaleAdmittedObject} {D : DoobInequalityPackage}
    (C : ConvergencePackage) where
  upcrossingInequalityClosed : C.upcrossingInequality
  almostSureConvergenceClosed : C.almostSureConvergence
  l1ConvergenceClosed : C.l1Convergence

def ConvergenceClosed {M : MartingaleAdmittedObject} {D : DoobInequalityPackage}
    (C : ConvergencePackage) : Prop :=
  C.upcrossingInequality ∧ C.almostSureConvergence ∧ C.l1Convergence

theorem convergence_closed_from_evidence {M : MartingaleAdmittedObject} {D : DoobInequalityPackage}
    (C : ConvergencePackage) (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.upcrossingInequalityClosed
    (And.intro E.almostSureConvergenceClosed E.l1ConvergenceClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse