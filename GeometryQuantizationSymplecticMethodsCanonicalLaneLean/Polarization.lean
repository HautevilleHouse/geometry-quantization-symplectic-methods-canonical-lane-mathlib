import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.PrequantumLineBundle

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure PolarizationPackage {S : SymplecticManifoldPackage}
    {L : PrequantumLineBundlePackage S.symplecticForm} where
  lagrangianDistribution : Type u
  integrable : Prop
  leafSmooth : Prop
  halfFormBundle : Type v
  metaplecticCorrection : Prop
  integrableClosed : integrable
  leafSmoothClosed : leafSmooth
  metaplecticCorrectionClosed : metaplecticCorrection

structure PolarizationEvidence {S : SymplecticManifoldPackage}
    {L : PrequantumLineBundlePackage S.symplecticForm}
    (P : PolarizationPackage L) where
  integrableClosedClosed : P.integrableClosed
  leafSmoothClosedClosed : P.leafSmoothClosed
  metaplecticCorrectionClosedClosed : P.metaplecticCorrectionClosed

def PolarizationClosed {S : SymplecticManifoldPackage}
    {L : PrequantumLineBundlePackage S.symplecticForm}
    (P : PolarizationPackage L) : Prop :=
  P.integrableClosed ∧ P.leafSmoothClosed ∧ P.metaplecticCorrectionClosed

theorem polarization_closed_from_evidence
    {S : SymplecticManifoldPackage} {L : PrequantumLineBundlePackage S.symplecticForm}
    (P : PolarizationPackage L) (E : PolarizationEvidence P) :
    PolarizationClosed P := by
  exact And.intro E.integrableClosedClosed
    (And.intro E.leafSmoothClosedClosed E.metaplecticCorrectionClosedClosed)

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
