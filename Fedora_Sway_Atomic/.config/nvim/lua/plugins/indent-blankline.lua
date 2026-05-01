return {

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      -- We zetten de standaard stippellijntjes (indent) UIT voor maximale rust
      indent = {
        char = '', -- Geen karakter voor de standaard lijnen
      },
      -- We zetten alleen de SCOPE (waar je bent) AAN
      scope = {
        enabled = true,
        show_start = true, -- Toont een streepje bij de beginnende {
        show_end = true, -- Toont een streepje bij de sluitende }
        char = '│', -- Een heel dun verticaal lijntje
        highlight = { 'LineNr' },
        -- highlight = { 'Function', 'Label' }, -- Gebruik een kleur uit je thema (bijv. paars/blauw van Tokyonight)
      },
    },
  },
}
