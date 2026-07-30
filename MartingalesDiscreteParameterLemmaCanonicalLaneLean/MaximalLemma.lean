import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleDefinition

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MaximalLemmaPackage {M : FiltrationSpace} (P : MartingalePackage M) where
  weakTypeInequality : Prop
  strongTypeInequality : Prop
  applicationToConvergence : Prop

structure MaximalLemmaEvidence {M : FiltrationSpace} {P : MartingalePackage M} (L : MaximalLemmaPackage P) where
  weakTypeInequalityClosed : L.weakTypeInequality
  strongTypeInequalityClosed : L.strongTypeInequality
  applicationToConvergenceClosed : L.applicationToConvergence

def MaximalLemmaClosed {M : FiltrationSpace} {P : MartingalePackage M} (L : MaximalLemmaPackage P) : Prop :=
  L.weakTypeInequality ∧ L.strongTypeInequality ∧ L.applicationToConvergence

theorem maximal_lemma_closed_from_evidence {M : FiltrationSpace} {P : MartingalePackage M} (L : MaximalLemmaPackage P) (E : MaximalLemmaEvidence L) : MaximalLemmaClosed L := by
  exact And.intro E.weakTypeInequalityClosed (And.intro E.strongTypeInequalityClosed E.applicationToConvergenceClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse