defmodule RPG do
  defprotocol Edible do
    def eat(item, character)
  end
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defimpl Edible, for: LoafOfBread do
    def eat(%LoafOfBread{}, char = %Character{health: health}) do
      {nil, %Character{char | health: health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    def eat(%ManaPotion{strength: strength}, char = %Character{mana: mana}) do
      {%EmptyBottle{}, %Character{char | mana: mana + strength}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(%Poison{}, char = %Character{}) do
      {%EmptyBottle{}, %Character{char | health: 0}}
    end
  end
end
