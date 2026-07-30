import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.BackgroundSigmaAlgebra
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.DiscreteTimeIndexSet

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure FiltrationSystem {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} where
  sigmaAlgebras : T.indexType → Set (Set B.carrier)
  adapted : True
  increasing : ∀ (i j : T.indexType), T.order i j → sigmaAlgebras i ⊆ sigmaAlgebras j

def FiltrationSystemClosed {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} (F : FiltrationSystem B T) : Prop :=
  F.adapted ∧ ∀ (i j : T.indexType), T.order i j → F.sigmaAlgebras i ⊆ F.sigmaAlgebras j

-- evidence structure
structure FiltrationSystemEvidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} (F : FiltrationSystem B T) where
  adaptedClosed : F.adapted
  increasingClosed : ∀ (i j : T.indexType), T.order i j → F.sigmaAlgebras i ⊆ F.sigmaAlgebras j

theorem filtration_system_closed_from_evidence {B : BackgroundSigmaAlgebra} {T : DiscreteTimeIndexSet} (F : FiltrationSystem B T) (E : FiltrationSystemEvidence F) : FiltrationSystemClosed F := by
  exact And.intro E.adaptedClosed E.increasingClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse