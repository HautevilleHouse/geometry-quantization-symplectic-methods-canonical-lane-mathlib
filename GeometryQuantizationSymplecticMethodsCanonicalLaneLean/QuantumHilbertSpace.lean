import canonicalLaneMathlib.AdmissibleClass
import GeometryQuantizationSymplecticMethods.MetaplecticCorrection

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethods

structure QuantumHilbertSpace where
  correction : MetaplecticCorrection
  hilbertSpace : Type u
  innerProduct : hilbertSpace → hilbertSpace → ℂ
  completeness : Prop
  separability : Prop
  quantizationMap : (correction.prequantumBundle.baseSpace.carrier → ℂ) → hilbertSpace
  equivariance : Prop

structure QuantumHilbertSpaceEvidence (H : QuantumHilbertSpace) where
  completenessClosed : H.completeness
  separabilityClosed : H.separability
  equivarianceClosed : H.equivariance

def QuantumHilbertSpaceClosed (H : QuantumHilbertSpace) : Prop :=
  H.completeness ∧ H.separability ∧ H.equivariance

theorem quantum_hilbert_space_closed_from_evidence (H : QuantumHilbertSpace) (E : QuantumHilbertSpaceEvidence H) : QuantumHilbertSpaceClosed H := by
  exact And.intro E.completenessClosed (And.intro E.separabilityClosed E.equivarianceClosed)

end GeometryQuantizationSymplecticMethods
end HautevilleHouse