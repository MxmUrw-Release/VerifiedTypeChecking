
module Verification.Core.Data.Language.HindleyMilner.Variant.Classical.Typed.Imports where

-------------
-- Classes
open import Verification.Core.Set.Setoid.Definition public
open import Verification.Core.Order.Preorder public
open import Verification.Core.Set.Discrete public
open import Verification.Core.Algebra.Monoid.Definition public

-------------
-- Categories and unification
open import Verification.Core.Category.Std.Morphism.Iso public renaming (_≅_ to _≅ᵘ_ ; ⟨_⟩⁻¹ to ⟨_⟩⁻¹ᵘ)
open import Verification.Core.Category.Std.Morphism.Epi.Definition public
open import Verification.Core.Category.Std.Category.Subcategory.Full public
open import Verification.Core.Category.Std.Limit.Specific.Coequalizer public
-- open import Verification.Core.Category.Std.Limit.Specific.Coproduct.Definition
open import Verification.Core.Category.Std.Limit.Specific.Coproduct.Definition using (append-⦗⦘ ; ⦗≀_≀⦘) public
open import Verification.Core.Category.Std.Limit.Specific.Coproduct.Instance.Functor public
open import Verification.Core.Category.Std.Factorization.EpiMono.Variant.Split.Definition public
open import Verification.Core.Computation.Unification.Definition public

-------------
-- Lists
open import Verification.Core.Data.List.Variant.Unary.Definition public
open import Verification.Core.Data.List.Variant.Unary.Element public
open import Verification.Core.Data.List.Variant.Unary.Natural public
open import Verification.Core.Data.List.Variant.Binary.Definition public
open import Verification.Core.Data.List.Variant.Unary.Element public
open import Verification.Core.Data.List.Variant.Binary.Element.Definition public
open import Verification.Core.Data.List.Dependent.Variant.Unary.Definition public
open import Verification.Core.Data.List.Dependent.Variant.Binary.Definition public

-------------
-- Simple terms
open import Verification.Core.Theory.Std.Specific.FreeFiniteCoproductTheory.Param public
open import Verification.Core.Theory.Std.Specific.FreeFiniteCoproductTheory.Definition public
open import Verification.Core.Theory.Std.Specific.FreeFiniteCoproductTheory.Instance.Functor public
open import Verification.Core.Theory.Std.Specific.FreeFiniteCoproductTheory.Instance.RelativeMonad public
open import Verification.Core.Theory.Std.Specific.FreeFiniteCoproductTheory.Unification public

-------------
-- Types as simple terms
open import Verification.Core.Data.Language.HindleyMilner.Type.Variant.FreeFiniteCoproductTheoryTerm.Signature public
open import Verification.Core.Data.Language.HindleyMilner.Type.Variant.FreeFiniteCoproductTheoryTerm.Definition public

-------------
-- Other data

open import Verification.Core.Data.Product.Definition public
open import Verification.Core.Data.Sum.Definition public
open import Verification.Core.Data.Substitution.Variant.Base.Definition public


-------------
-- Specialized category modules
open Overwrite:isCategory:⧜𝒯⊔Term 𝒹 public
open Overwrite:isCoproduct:⧜𝒯⊔Term 𝒹 public
open Overwrite:hasCoproducts:⧜𝒯⊔Term 𝒹 public
open Overwrite:hasFiniteCoproducts:⧜𝒯⊔Term 𝒹 public
open Overwrite:hasInitial:⧜𝒯⊔Term 𝒹 public
open Overwrite:isInitial:⧜𝒯⊔Term 𝒹 public

-------------
-- Other specialized definitions

_⟶_ = Hom

_≅_ = _≅ᵘ_ {𝒞 = ⧜𝒯⊔Term 𝒹} {{isCategory:⧜𝐒𝐮𝐛𝐬𝐭 {T = 𝒯⊔term 𝒹}}}
⟨_⟩⁻¹ = ⟨_⟩⁻¹ᵘ {𝒞 = ⧜𝒯⊔Term 𝒹} {{isCategory:⧜𝐒𝐮𝐛𝐬𝐭 {T = 𝒯⊔term 𝒹}}}

-- {-# DISPLAY isCoequalizer.π₌ _ = π₌ #-}
-- {-# DISPLAY isCoproduct.ι₀ _ = ι₀ #-}
-- {-# DISPLAY isCoproduct.ι₁ _ = ι₁ #-}
{-# DISPLAY _内◆-⧜𝐒𝐮𝐛𝐬𝐭_ f g = f ◆ g #-}
{-# DISPLAY 内id-⧜𝐒𝐮𝐛𝐬𝐭 = id #-}


instance
  hasSplitEpiMonoFactorization:ℒHMTypes : hasSplitEpiMonoFactorization ℒHMTypes
  hasSplitEpiMonoFactorization:ℒHMTypes = {!!}





--------------------------------------
-- NOTE
-- This is code copied from:
--   module Verification.Core.Category.Std.Limit.Specific.Coproduct.Properties.Monoidal where
-- It is unclear why instantiation does
-- not work here.
--

-------------
-- BEGIN DUPLICATE CODE
--

open import Verification.Conventions hiding (_⊔_)

byExpand-ι₀,ι₁ : ∀{a b c : ℒHMTypes} -> {f g : a ⊔ b ⟶ c}
                  -> ι₀ ◆ f ∼ ι₀ ◆ g
                  -> ι₁ ◆ f ∼ ι₁ ◆ g
                  -> f ∼ g
byExpand-ι₀,ι₁ {f = f} {g} p₀ p₁ =
  f                   ⟨ expand-ι₀,ι₁ ⟩-∼
  ⦗ ι₀ ◆ f , ι₁ ◆ f ⦘ ⟨ ⦗≀ p₀ , p₁ ≀⦘ ⟩-∼
  ⦗ ι₀ ◆ g , ι₁ ◆ g ⦘ ⟨ expand-ι₀,ι₁ ⁻¹ ⟩-∼
  g                   ∎

module assoc-l-⊔' {a b c : ℒHMTypes} where

  f : (a ⊔ b) ⊔ c ⟶ a ⊔ (b ⊔ c)
  f = ⦗ ⦗ ι₀ , ι₀ ◆ ι₁ ⦘ , ι₁ ◆ ι₁ ⦘

  g : a ⊔ (b ⊔ c) ⟶ (a ⊔ b) ⊔ c
  g = ⦗ ι₀ ◆ ι₀ , ⦗ ι₁ ◆ ι₀ , ι₁ ⦘ ⦘

  lem-1a : ι₀ ◆ (ι₀ ◆ (f ◆ g)) ∼ ι₀ ◆ (ι₀ ◆ id)
  lem-1a = ι₀ ◆ (ι₀ ◆ (f ◆ g))   ⟨ refl ◈ assoc-r-◆ ⟩-∼
            ι₀ ◆ ((ι₀ ◆ f) ◆ g)   ⟨ refl ◈ (reduce-ι₀ ◈ refl) ⟩-∼
            ι₀ ◆ (_ ◆ g)          ⟨ assoc-r-◆ ⟩-∼
            (ι₀ ◆ _) ◆ g          ⟨ reduce-ι₀ ◈ refl ⟩-∼
            ι₀ ◆ g                ⟨ reduce-ι₀ ⟩-∼
            ι₀ ◆ ι₀               ⟨ refl ◈ unit-r-◆ ⁻¹ ⟩-∼
            ι₀ ◆ (ι₀ ◆ id)        ∎

  lem-1b : ι₁ ◆ (ι₀ ◆ (f ◆ g)) ∼ ι₁ ◆ (ι₀ ◆ id)
  lem-1b = ι₁ ◆ (ι₀ ◆ (f ◆ g))   ⟨ refl ◈ assoc-r-◆ ⟩-∼
            ι₁ ◆ ((ι₀ ◆ f) ◆ g)   ⟨ refl ◈ (reduce-ι₀ ◈ refl) ⟩-∼
            ι₁ ◆ (_ ◆ g)          ⟨ assoc-r-◆ ⟩-∼
            (ι₁ ◆ _) ◆ g          ⟨ reduce-ι₁ ◈ refl ⟩-∼
            (ι₀ ◆ ι₁) ◆ g         ⟨ assoc-l-◆ ⟩-∼
            ι₀ ◆ (ι₁ ◆ g)         ⟨ refl ◈ reduce-ι₁ ⟩-∼
            ι₀ ◆ _                ⟨ reduce-ι₀ ⟩-∼
            ι₁ ◆ ι₀               ⟨ refl ◈ unit-r-◆ ⁻¹ ⟩-∼
            ι₁ ◆ (ι₀ ◆ id)        ∎

  lem-1c : ι₁ ◆ (f ◆ g) ∼ ι₁ ◆ id
  lem-1c = ι₁ ◆ (f ◆ g)          ⟨ assoc-r-◆ ⟩-∼
            (ι₁ ◆ f) ◆ g          ⟨ reduce-ι₁ ◈ refl ⟩-∼
            (ι₁ ◆ ι₁) ◆ g         ⟨ assoc-l-◆ ⟩-∼
            ι₁ ◆ (ι₁ ◆ g)         ⟨ refl ◈ reduce-ι₁ ⟩-∼
            ι₁ ◆ _                ⟨ reduce-ι₁ ⟩-∼
            ι₁                    ⟨ unit-r-◆ ⁻¹ ⟩-∼
            ι₁ ◆ id               ∎

  lem-1 : f ◆ g ∼ id
  lem-1 = byExpand-ι₀,ι₁ (byExpand-ι₀,ι₁ lem-1a lem-1b) lem-1c

  lem-2a : ι₀ ◆ (g ◆ f) ∼ ι₀ ◆ id
  lem-2a = ι₀ ◆ (g ◆ f)          ⟨ assoc-r-◆ ⟩-∼
            (ι₀ ◆ g) ◆ f          ⟨ reduce-ι₀ ◈ refl ⟩-∼
            (ι₀ ◆ ι₀) ◆ f         ⟨ assoc-l-◆ ⟩-∼
            ι₀ ◆ (ι₀ ◆ f)         ⟨ refl ◈ reduce-ι₀ ⟩-∼
            ι₀ ◆ _                ⟨ reduce-ι₀ ⟩-∼
            ι₀                    ⟨ unit-r-◆ ⁻¹ ⟩-∼
            ι₀ ◆ id               ∎

  lem-2b : ι₀ ◆ (ι₁ ◆ (g ◆ f)) ∼ ι₀ ◆ (ι₁ ◆ id)
  lem-2b = ι₀ ◆ (ι₁ ◆ (g ◆ f))   ⟨ refl ◈ assoc-r-◆ ⟩-∼
            ι₀ ◆ ((ι₁ ◆ g) ◆ f)   ⟨ refl ◈ (reduce-ι₁ ◈ refl) ⟩-∼
            ι₀ ◆ (_ ◆ f)          ⟨ assoc-r-◆ ⟩-∼
            (ι₀ ◆ _) ◆ f          ⟨ reduce-ι₀ ◈ refl ⟩-∼
            (ι₁ ◆ ι₀) ◆ f         ⟨ assoc-l-◆ ⟩-∼
            ι₁ ◆ (ι₀ ◆ f)         ⟨ refl ◈ reduce-ι₀ ⟩-∼
            ι₁ ◆ _                ⟨ reduce-ι₁ ⟩-∼
            ι₀ ◆ ι₁               ⟨ refl ◈ unit-r-◆ ⁻¹ ⟩-∼
            ι₀ ◆ (ι₁ ◆ id)        ∎

  lem-2c : ι₁ ◆ (ι₁ ◆ (g ◆ f)) ∼ ι₁ ◆ (ι₁ ◆ id)
  lem-2c = ι₁ ◆ (ι₁ ◆ (g ◆ f))   ⟨ refl ◈ assoc-r-◆ ⟩-∼
            ι₁ ◆ ((ι₁ ◆ g) ◆ f)   ⟨ refl ◈ (reduce-ι₁ ◈ refl) ⟩-∼
            ι₁ ◆ (_ ◆ f)          ⟨ assoc-r-◆ ⟩-∼
            (ι₁ ◆ _) ◆ f          ⟨ reduce-ι₁ ◈ refl ⟩-∼
            ι₁ ◆ f                ⟨ reduce-ι₁ ⟩-∼
            ι₁ ◆ ι₁               ⟨ refl ◈ unit-r-◆ ⁻¹ ⟩-∼
            ι₁ ◆ (ι₁ ◆ id)        ∎

  lem-2 : g ◆ f ∼ id
  lem-2 = byExpand-ι₀,ι₁ lem-2a (byExpand-ι₀,ι₁ lem-2b lem-2c)

  Proof : (a ⊔ b) ⊔ c ≅ a ⊔ (b ⊔ c)
  Proof = f since record { inverse-◆ = g ; inv-r-◆ = lem-1 ; inv-l-◆ = lem-2 }


module §-assoc-l-⊔' where
  prop-1 : ∀{a b c : ℒHMTypes} -> (ι₀ ◆ ι₀) ◆ ⟨ assoc-l-⊔'.Proof {a = a} {b} {c} ⟩ ∼ ι₀
  prop-1 = (ι₀ ◆ ι₀) ◆ _  ⟨ assoc-l-◆ ⟩-∼
            ι₀ ◆ (ι₀ ◆ _)  ⟨ refl ◈ reduce-ι₀ ⟩-∼
            ι₀ ◆ _         ⟨ reduce-ι₀ ⟩-∼
            ι₀             ∎

  prop-2 : ∀{a b c x : ℒHMTypes}
           -> {f : a ⟶ x} {g : b ⟶ x} {h : c ⟶ x}
           -> ⦗ f , ⦗ g , h ⦘ ⦘ ∼ ⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘
  prop-2 {f = f} {g} {h} = byExpand-ι₀,ι₁ lem-1 (byExpand-ι₀,ι₁ lem-2 lem-3)
    where
      lem-1 : ι₀ ◆ ⦗ f , ⦗ g , h ⦘ ⦘ ∼ ι₀ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)
      lem-1 = ι₀ ◆ ⦗ f , ⦗ g , h ⦘ ⦘   ⟨ reduce-ι₀ ⟩-∼
              f                                                   ⟨ reduce-ι₀ ⁻¹ ⟩-∼
              ι₀ ◆ ⦗ f , g ⦘                                      ⟨ refl ◈ reduce-ι₀ ⁻¹ ⟩-∼
              ι₀ ◆ (ι₀ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)                       ⟨ assoc-r-◆ ⟩-∼
              (ι₀ ◆ ι₀) ◆ ⦗ ⦗ f , g ⦘ , h ⦘                       ⟨ reduce-ι₀ ⁻¹ ◈ refl ⟩-∼
              (ι₀ ◆ ⟨ assoc-l-⊔'.Proof ⟩⁻¹) ◆ ⦗ ⦗ f , g ⦘ , h ⦘   ⟨ assoc-l-◆ ⟩-∼
              ι₀ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ∎

      lem-2 : ι₀ ◆ (ι₁ ◆ ⦗ f , ⦗ g , h ⦘ ⦘) ∼ ι₀ ◆ (ι₁ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘))
      lem-2 = ι₀ ◆ (ι₁ ◆ ⦗ f , ⦗ g , h ⦘ ⦘)   ⟨ refl ◈ reduce-ι₁ ⟩-∼
              ι₀ ◆ ⦗ g , h ⦘   ⟨ reduce-ι₀ ⟩-∼
              g   ⟨ reduce-ι₁ ⁻¹ ⟩-∼
              ι₁ ◆ ⦗ f , g ⦘   ⟨ refl ◈ reduce-ι₀ ⁻¹ ⟩-∼
              ι₁ ◆ (ι₀ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ⟨ assoc-r-◆ ⟩-∼
              (ι₁ ◆ ι₀) ◆ ⦗ ⦗ f , g ⦘ , h ⦘   ⟨ reduce-ι₀ ⁻¹ ◈ refl ⟩-∼
              (ι₀ ◆ _) ◆ ⦗ ⦗ f , g ⦘ , h ⦘   ⟨ assoc-l-◆ ⟩-∼
              ι₀ ◆ (_ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ⟨ refl ◈ (reduce-ι₁ ⁻¹ ◈ refl) ⟩-∼
              ι₀ ◆ ((ι₁ ◆ _) ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ⟨ refl ◈ assoc-l-◆ ⟩-∼
              ι₀ ◆ (ι₁ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘))   ∎

      lem-3 : ι₁ ◆ (ι₁ ◆ ⦗ f , ⦗ g , h ⦘ ⦘) ∼ ι₁ ◆ (ι₁ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘))
      lem-3 = ι₁ ◆ (ι₁ ◆ ⦗ f , ⦗ g , h ⦘ ⦘)   ⟨ refl ◈ reduce-ι₁ ⟩-∼
              ι₁ ◆ ⦗ g , h ⦘   ⟨ reduce-ι₁ ⟩-∼
              h   ⟨ reduce-ι₁ ⁻¹ ⟩-∼
              (ι₁) ◆ ⦗ ⦗ f , g ⦘ , h ⦘   ⟨ reduce-ι₁ ⁻¹ ◈ refl ⟩-∼
              (ι₁ ◆ _) ◆ ⦗ ⦗ f , g ⦘ , h ⦘   ⟨ assoc-l-◆ ⟩-∼
              ι₁ ◆ (_ ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ⟨ refl ◈ (reduce-ι₁ ⁻¹ ◈ refl) ⟩-∼
              ι₁ ◆ ((ι₁ ◆ _) ◆ ⦗ ⦗ f , g ⦘ , h ⦘)   ⟨ refl ◈ assoc-l-◆ ⟩-∼
              ι₁ ◆ (ι₁ ◆ (⟨ assoc-l-⊔'.Proof ⟩⁻¹ ◆ ⦗ ⦗ f , g ⦘ , h ⦘))   ∎


assoc-l-⊔-ℒHMTypes : ∀{a b c : ℒHMTypes} -> (a ⊔ b) ⊔ c ≅ a ⊔ (b ⊔ c)
assoc-l-⊔-ℒHMTypes {a} {b} {c} = assoc-l-⊔'.Proof {a = a} {b} {c}

--
-- END DUPLICATE CODE
-------------
