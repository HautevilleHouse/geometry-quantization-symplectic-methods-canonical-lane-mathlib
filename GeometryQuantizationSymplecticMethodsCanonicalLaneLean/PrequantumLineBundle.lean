import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GeometryQuantizationSymplecticMethodsCanonicalLaneLean.SymplecticPrequantization

namespace HautevilleHouse
namespace GeometryQuantizationSymplecticMethodsCanonicalLaneLean

structure PrequantumLineBundlePackage {S : SymplecticManifoldPackage}
    (L : S.symplecticForm) where
  lineBundle : Type u
  connection : Type v
  curvatureMatchesForm : Prop
  hermitianMetric : Type w
  metricCompatible : Prop
  lineBundleSmooth : Prop
  curvatureMatchesFormClosed : curvatureMatchesForm
  metricCompatibleClosed : metricCompatible

structure PrequantumLineBundleEvidence {S : SymplecticManifoldPackage}
    {L : S.symplecticForm} (P : PrequantumLineBundlePackage L) where
  lineBundleSmoothClosed : P.lineBundleSmooth
  curvatureMatchesFormClosedClosed : P.curvatureMatchesFormClosed
  metricCompatibleClosedClosed : P.metricCompatibleClosed

def PrequantumLineBundleClosed {S : SymplecticManifoldPackage}
    {L : S.symplecticForm} (P : PrequantumLineBundlePackage L) : Prop :=
  P.lineBundleSmooth ∧ P.curvatureMatchesFormClosed ∧ P.metricCompatibleClosed

theorem prequantum_line_bundle_closed_from_evidence
    {S : SymplecticManifoldPackage} {L : S.symplecticForm}
    (P : PrequantumLineBundlePackage L) (E : PrequantumLineBundleEvidence P) :
    PrequantumLineBundleClosed P := by
  exact And.intro E.lineBundleSmoothClosed
    (And.intro E.curvatureMatchesFormClosedClosed E.metricCompatibleClosedClosed)

end GeometryQuantizationSymplecticMethodsCanonicalLaneLean
end HautevilleHouse
