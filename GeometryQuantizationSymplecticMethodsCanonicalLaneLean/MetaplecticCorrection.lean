import canonicalLaneMathlib.AdmissibleClass
import GeometryQuantizationSymplecticMethods.PrequantumLineBundle
import GeometryQuantizationSymplecticMethods.PolarizationStructure

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethods

structure MetaplecticCorrection where
  prequantumBundle : PrequantumLineBundle
  polarization : PolarizationStructure
  halfFormBundle : Type u
  metaplecticStructure : Prop
  correctionFactor : Prop
  pairingDefined : Prop

structure MetaplecticCorrectionEvidence (M : MetaplecticCorrection) where
  metaplecticStructureClosed : M.metaplecticStructure
  correctionFactorClosed : M.correctionFactor
  pairingDefinedClosed : M.pairingDefined

def MetaplecticCorrectionClosed (M : MetaplecticCorrection) : Prop :=
  M.metaplecticStructure ∧ M.correctionFactor ∧ M.pairingDefined

theorem metaplectic_correction_closed_from_evidence (M : MetaplecticCorrection) (E : MetaplecticCorrectionEvidence M) : MetaplecticCorrectionClosed M := by
  exact And.intro E.metaplecticStructureClosed (And.intro E.correctionFactorClosed E.pairingDefinedClosed)

end GeometryQuantizationSymplecticMethods
end HautevilleHouse