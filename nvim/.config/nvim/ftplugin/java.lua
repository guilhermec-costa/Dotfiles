local home = os.getenv('HOME')

local bundles = {
    vim.fn.glob(home .. '/dev/Java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar', 1)
};
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/dev/Java/vscode-java-test/server/*.jar', 1), '\n'))

local capabilities = {
    workspace = {
        configuration = true
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true
            }
        }
    }
}

local config = {
    cmd = {
        "/sbin/jdtls",
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob(home .. '/dev/eclipse/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'),
    },

    on_attach = function(client, bufrn)
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end,

    signatureHelp = { enabled = true },
    contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
    -- Specify any completion options
    completion = {
    favoriteStaticMembers = {
      "org.hamcrest.MatcherAssert.assertThat",
      "org.hamcrest.Matchers.*",
      "org.hamcrest.CoreMatchers.*",
      "org.junit.jupiter.api.Assertions.*",
      "java.util.Objects.requireNonNull",
      "java.util.Objects.requireNonNullElse",
      "org.mockito.Mockito.*"
    },

    filteredTypes = {
      "com.sun.*",
      "io.micrometer.shaded.*",
      "java.awt.*",
      "jdk.*", "sun.*",
        },
    },

    sources = {
            organizeImports = {
                starThreshold = 9999;
                staticStarThreshold = 9999;
        }
    },

    codeGeneration = {
        toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },

        hashCodeEquals = {
            useJava7Objects = true,
        },

        useBlocks = true,
    },

    init_options = {
        bundles = bundles,
    },

    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities=capabilities
}

local opts = { noremap=true, silent=true }
-- Java specific keymaps. Code action options are beautiful
vim.keymap.set("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
vim.keymap.set("n", "<leader>tm", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
vim.keymap.set("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
vim.keymap.set("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
vim.keymap.set("n", "<leader>gt", "<Esc><Cmd>lua require('jdtls.tests').generate()<CR>", opts)

require('jdtls').start_or_attach(config)


