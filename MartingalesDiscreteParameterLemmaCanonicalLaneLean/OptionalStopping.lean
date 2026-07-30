import canonicalLaneMathlib.AdmissibleClass
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleDefinition
import MartingalesDiscreteParameterLemmaCanonicalLaneLean.StoppingTimePackage

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure OptionalStoppingPackage {M : FiltrationSpace} {P : MartingalePackage M} (S : StoppingTimePackage M) where
  boundedStoppingTimes : Prop
  integrabilityCondition : Prop
  optionalStoppingTheorem : Prop

structure OptionalStoppingEvidence {M : FiltrationSpace} {P : MartingalePackage M} {S : StoppingTimePackage M} (O : OptionalStoppingPackage S) where
  boundedStoppingTimesClosed : O.boundedStoppingTimes
  integrabilityConditionClosed : O.integrabilityCondition
  optionalStoppingTheoremClosed : O.optionalStoppingTheorem

def OptionalStoppingClosed {M : FiltrationSpace} {P : MartingalePackage M} {S : StoppingTimePackage M} (O : OptionalStoppingPackage S) : Prop :=
  O.boundedStoppingTimes ∧ O.integrabilityCondition ∧ O.optionalStoppingTheorem

theorem optional_stopping_closed_from_evidence {M : FiltrationSpace} {P : MartingalePackage M} {S : StoppingTimePackage M} (O : OptionalStoppingPackage S) (E : OptionalStoppingEvidence O) : OptionalStoppingClosed O := by
  exact And.intro E.boundedStoppingTimesClosed (And.intro E.integrabilityConditionClosed E.optionalStoppingTheoremClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse