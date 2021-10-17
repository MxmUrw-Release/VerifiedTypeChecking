
module Verification.Experimental.Theory.Std.Specific.MetaTermCalculus2.Pattern.Factorization where

open import Verification.Experimental.Conventions hiding (Structure ; _⊔_ ; extend)
open import Verification.Experimental.Algebra.Monoid.Definition
open import Verification.Experimental.Algebra.Monoid.Free
open import Verification.Experimental.Algebra.Monoid.Free.Element
open import Verification.Experimental.Order.Lattice hiding (⊥)
open import Verification.Experimental.Data.Universe.Everything
open import Verification.Experimental.Data.Product.Definition
open import Verification.Experimental.Theory.Std.Generic.TypeTheory.Definition
open import Verification.Experimental.Theory.Std.Generic.TypeTheory.Simple
open import Verification.Experimental.Theory.Std.Generic.TypeTheory.Simple.Judgement2
open import Verification.Experimental.Theory.Std.TypologicalTypeTheory.CwJ.Kinding
open import Verification.Experimental.Theory.Std.Generic.TypeTheory.Simple
open import Verification.Experimental.Theory.Std.Specific.MetaTermCalculus2.Pattern.Definition

open import Verification.Experimental.Category.Std.Category.Definition
open import Verification.Experimental.Category.Std.Category.Opposite
open import Verification.Experimental.Category.Std.Category.Opposite.Instance.Monoid
open import Verification.Experimental.Category.Std.Category.Instance.Category
open import Verification.Experimental.Category.Std.Category.Structured.Monoidal.Definition
open import Verification.Experimental.Category.Std.Functor.Definition
open import Verification.Experimental.Category.Std.RelativeMonad.Definition
open import Verification.Experimental.Category.Std.RelativeMonad.KleisliCategory.Definition
open import Verification.Experimental.Category.Std.Category.Subcategory.Definition
open import Verification.Experimental.Category.Std.Morphism.EpiMono
open import Verification.Experimental.Category.Std.Limit.Specific.Coproduct.Preservation.Definition
open import Verification.Experimental.Category.Std.Limit.Specific.Coproduct.Definition
open import Verification.Experimental.Category.Std.Limit.Specific.Coproduct.Instance.Functor

open import Verification.Experimental.Data.Nat.Free
open import Verification.Experimental.Data.Universe.Everything
open import Verification.Experimental.Data.Universe.Instance.FiniteCoproductCategory
open import Verification.Experimental.Data.Indexed.Definition
open import Verification.Experimental.Data.Indexed.Instance.Monoid
open import Verification.Experimental.Data.FiniteIndexed.Definition
open import Verification.Experimental.Data.Indexed.Instance.FiniteCoproductCategory
open import Verification.Experimental.Data.Renaming.Definition
open import Verification.Experimental.Data.Renaming.Instance.CoproductMonoidal
open import Verification.Experimental.Data.Substitution.Definition
open import Verification.Experimental.Data.MultiRenaming.Definition
open import Verification.Experimental.Data.MultiRenaming.Instance.FiniteCoproductCategory

open import Verification.Experimental.Category.Std.Category.Opposite
open import Verification.Experimental.Category.Std.Category.Subcategory.Full
open import Verification.Experimental.Category.Std.Category.Subcategory.Definition
open import Verification.Experimental.Category.Std.Fibration.GrothendieckConstruction.Op.Definition
open import Verification.Experimental.Category.Std.Fibration.GrothendieckConstruction.Op.Instance.FiniteCoproductCategory



module _ {A : 𝒰 𝑖} where
  FinFam : (as : Free-𝐌𝐨𝐧 A) -> (B : 𝒰 𝑗) -> 𝒰 _
  FinFam as B = ∀{a} -> (as ∍ a) -> B

  data ⧜FinFam (B : 𝒰 𝑗) : (as : Free-𝐌𝐨𝐧 A) -> 𝒰 (𝑖 ､ 𝑗) where
    incl : ∀{a} -> B -> ⧜FinFam B (incl a)
    ◌-⧜ : ⧜FinFam B ◌
    _⋆-⧜_ : ∀{as bs} -> ⧜FinFam B as -> ⧜FinFam B bs -> ⧜FinFam B (as ⋆ bs)


  data ∏-⧜FinFam {𝑗} : (as : Free-𝐌𝐨𝐧 A) (B : ⧜FinFam (𝒰 𝑗) as) -> 𝒰 (𝑖 ､ 𝑗 ⁺) where
    incl : ∀{a} {B : 𝒰 𝑗} -> (b : B) -> ∏-⧜FinFam (incl a) (incl B)
    _⋆-⧜_ : ∀{as bs A B} -> ∏-⧜FinFam as A -> ∏-⧜FinFam bs B -> ∏-⧜FinFam (as ⋆ bs) (A ⋆-⧜ B)
    ◌-⧜ : ∏-⧜FinFam ◌ ◌-⧜

  module _ {X : 𝒰 _} {{_ : Monoid 𝑗 on X}} where
    ⭑ : {as : Free-𝐌𝐨𝐧 A} (F : FinFam as X) -> X
    ⭑ {incl x} F = F incl
    ⭑ {as ⋆-⧜ bs} F = ⭑ {as} (λ x → F (left-∍ x)) ⋆ ⭑ {bs} (λ x → F (right-∍ x))
    ⭑ {◌-⧜} F = ◌


module _ {K : Kinding 𝑖} {{_ : isMetaTermCalculus 𝑖 K}} where


  -- private
  --   (Jdg₂ ⟨ K ⟩) : 𝒰 _
  --   (Jdg₂ ⟨ K ⟩) = Jdg₂ ⟨ K ⟩


  ν₋ : 𝐌𝐮𝐥𝐭𝐢𝐑𝐞𝐧 ⟨ K ⟩ (Jdg₂ ⟨ K ⟩) -> Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)
  ν₋ (incl (incl a) , as)            = incl $ ⟨ ⟨ ⟨ ix as (a , incl) ⟩ ⟩ ⟩ ⇒ a
  ν₋ (incl (a ⋆-Free-𝐌𝐨𝐧 b) , as)   = ν₋ ((incl a) , {!!}) ⋆ ν₋ ((incl b) , {!!})
  ν₋ (incl ◌-Free-𝐌𝐨𝐧 , as)          = {!!}

  -- ν₋ (interren (incl (incl α)) αs) = incl (⟨ ⟨ αs incl ⟩ ⟩ ⇒ α)
  -- ν₋ (interren (incl (a ⋆-Free-𝐌𝐨𝐧 b)) αs) = 
  -- ν₋ (interren (incl ◌-Free-𝐌𝐨𝐧) αs) = {!!}

  ν₊ : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩) -> 𝐌𝐮𝐥𝐭𝐢𝐑𝐞𝐧 ⟨ K ⟩ (Jdg₂ ⟨ K ⟩)
  ν₊ (incl (αs ⇒ α)) = incl (incl α) , indexed (λ x → incl (incl (incl αs)))
  -- interren (incl (incl α)) λ x → incl (incl αs)
  ν₊ (a ⋆-⧜ b) = ν₊ a ⊔ ν₊ b
  ν₊ ◌-⧜ = ⊥

  ν₊-∍ : ∀{J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} -> ∀{a} -> (p : ⟨ base (ν₊ J) ⟩ ∍ a) -> J ∍ (⟨ ⟨ ⟨ ix (fib (ν₊ J)) (a , p) ⟩ ⟩ ⟩ ⇒ a)
  ν₊-∍ {incl x} incl = incl
  ν₊-∍ {J₁ ⋆-Free-𝐌𝐨𝐧 J₂} (right-∍ p) = right-∍ (ν₊-∍ p)
  ν₊-∍ {J₁ ⋆-Free-𝐌𝐨𝐧 J₂} (left-∍ p)  = left-∍ (ν₊-∍ p)

  lift-ν₊ : ∀{J : 人List (Jdg₂ ⟨ K ⟩)} -> ∀{a} {Δ Γ : ♮𝐑𝐞𝐧 (Jdg₂ ⟨ K ⟩)} -> J ∍ (⟨ ⟨ Δ ⟩ ⟩ ⇒ a) -> (Δ ⟶ Γ) -> ν₊ (incl (⟨ ⟨ Γ ⟩ ⟩ ⇒ a)) ⟶ ν₊ J
  lift-ν₊ = {!!}




  mutual
    data Pat-inter (Γ : List (Jdg₂ ⟨ K ⟩)) : (Δ : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)) (𝔍 : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)) -> 𝒰 𝑖 where
      incl : ∀{𝔍 : (Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩))} -> ∀{j} -> 𝔍 ⊩-inter (γₗ Γ j) -> Pat-inter Γ (incl j) 𝔍
      _⋆-⧜_ : ∀{j1 j2 k1 k2} -> Pat-inter Γ j1 k1 -> Pat-inter Γ j2 k2 -> Pat-inter Γ (j1 ⋆ j2) (k1 ⋆ k2)
      ◌-⧜ : Pat-inter Γ ◌ ◌



    data _⊩-inter_ : (𝔍s : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)) -> (Jdg₂ ⟨ K ⟩) -> 𝒰 𝑖 where

      app-meta  : (Γ : ⟨ InjVars ⟩) (α : ⟨ K ⟩)
                -- -> (M : 𝔍 ∍ ((⟨ ⟨ Δ ⟩ ⟩ ⇒ α))) -- -> (s : (Δ) ⟶ (Γ))
                -> incl (⟨ ⟨ Γ ⟩ ⟩ ⇒ α) ⊩-inter (⟨ ⟨ Γ ⟩ ⟩  ⇒ α)

      app-var : ∀{𝔍 Γ Δ α}
              -> ι Γ ∍ (Δ ⇒ α) -> Pat-inter Γ (ι Δ) 𝔍
              -> 𝔍 ⊩-inter (Γ ⇒ α)

      app-con : ∀{𝔍 Γ Δ α}
              -> TermCon (Δ ⇒ α) -> Pat-inter Γ (ι Δ) 𝔍
              -> 𝔍 ⊩-inter (Γ ⇒ α)

  -- mutual
  --   compose-lam : {Γ : List (Jdg₂ ⟨ K ⟩)} {Δ : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} -> {I J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)}
  --               -> ν₊ (I) ⟶ ν₊ J
  --               -> Pat-inter Γ Δ I
  --               -> 𝑒𝑙 Δ ⟶ indexed (λ {j -> J ⊩ᶠ-pat (γₗ Γ j)})
  --   compose-lam f (incl x)  i incl        = compose f x
  --   compose-lam f (x ⋆-⧜ y) i (left-∍ p)  = compose-lam (ι₀ ◆ f) x i p
  --   compose-lam f (x ⋆-⧜ y) i (right-∍ p) = compose-lam (ι₁ ◆ f) y i p
  --   compose-lam f ◌-⧜       i ()


  --   compose : ∀{I J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} {i : (Jdg₂ ⟨ K ⟩)} -> (ν₊ I ⟶ ν₊ J) -> I ⊩-inter i -> J ⊩ᶠ-pat i
  --   compose {I} {J} f (app-meta Γ α) = app-meta (ν₊-∍ (⟨ base f ⟩ α incl)) ⟨(fib f (α , incl))⟩
  --   compose f (app-var x (tsx)) = app-var x (lam (compose-lam f tsx))
  --   compose f (app-con x (tsx)) = app-con x (lam (compose-lam f tsx))

  mutual
    decompose-lam : {Γ : List (Jdg₂ ⟨ K ⟩)} {Δ : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} -> {J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)}
                    -> Pat-pats Γ Δ J -> ∑ λ I -> ∑ λ (f : ν₊ I ⟶ ν₊ J) -> Pat-inter Γ Δ I
    decompose-lam (incl x) =
      let I , f , t = decompose x
      in I , f , incl t
    decompose-lam (x ⋆-⧜ y) =
      let I0 , f0 , p0 = decompose-lam x
          I1 , f1 , p1 = decompose-lam y
      in (I0 ⋆ I1) , map-⊔ (f0 , f1) , p0 ⋆-⧜ p1
    decompose-lam ◌-⧜ = ◌ , elim-⊥ , ◌-⧜

    -- decompose-lam {Δ = incl x₁} (lam x) =
    --   let I , f , t = decompose (x _ incl)
    --   in I , f , incl t
    -- decompose-lam {Δ = D ⋆-Free-𝐌𝐨𝐧 D₁} (lam x) =
    --   let I0 , f0 , p0 = decompose-lam (lam (λ _ a -> (x _ (left-∍ a))))
    --       I1 , f1 , p1 = decompose-lam (lam (λ _ a -> (x _ (right-∍ a))))
    --   in (I0 ⋆ I1) , ⦗ f0 , f1 ⦘ , p0 ⋆-⧜ p1
    -- decompose-lam {Δ = ◌-Free-𝐌𝐨𝐧} (lam x) = ◌ , elim-⊥ , ◌-⧜

    decompose : ∀{J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} {i : (Jdg₂ ⟨ K ⟩)} -> J ⊩ᶠ-pat i -> ∑ λ I -> ∑ λ (f : (ν₊ I ⟶ ν₊ J)) -> I ⊩-inter i
    -- decompose = {!!}
    decompose (app-meta {Γ = Γ} {Δ = Δ} {α = α} M s) = incl (⟨ ⟨ Γ ⟩ ⟩ ⇒ α) , (lift-ν₊ M s , app-meta Γ α)
    decompose (app-var x tsx) =
      let I , f , res = decompose-lam tsx
      in I , f , app-var x res
    decompose (app-con x tsx) =
      let I , f , res = decompose-lam tsx
      in I , f , app-con x res


    -- extend : ∀{J : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)} {Γ Δ : ♮𝐑𝐞𝐧 (Jdg₂ ⟨ K ⟩)} {α : ⟨ K ⟩} -> J ⊩-inter (⟨ ⟨ Δ ⟩ ⟩ ⇒ α) -> Γ ⟶ Δ
    --          -> ∑ λ (L : Free-𝐌𝐨𝐧 (Jdg₂ ⟨ K ⟩)) -> ∑ λ (f' : ν₊ J ⟶ ν₊ L) -> L ⊩-inter (⟨ ⟨ Γ ⟩ ⟩ ⇒ α)

    -- extend {J} {Γ} {Δ} {α} (app-meta (incl (incl a)) α) f = _ , ((id , λ i → incl f) , app-meta _ α)
    -- extend (app-var x x₁) f = {!!} , ({!!} , app-var {!!} {!!})
    -- extend (app-con x ts) f = {!!} , ({!!} , app-con x {!!})