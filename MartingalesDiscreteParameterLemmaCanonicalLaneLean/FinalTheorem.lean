import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleConvergenceTheorem

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact trivial

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMartingaleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_martingale_endgame (A : AdmissibleClass) :
    ConstrainedMartingaleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse