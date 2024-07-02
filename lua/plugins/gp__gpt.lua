return {
  "Robitx/gp.nvim",
  config = function()
    require("gp").setup({
      openai_api_key = "sk-MhNQo7OGg8zWllj8lznzfyjG0xgInKb4ctGJlv3r7sBvS8ND",
      openai_api_endpoint = "https://api.aiproxy.io/v1/chat/completions",
      agents = {
        {
          name = "ChatGPT4",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "你是一个计算机领域专家。\n\n"
            .. "用户提供了关于他们希望你如何回应的附加信息：\n\n"
            .. "- 如果你不确定，不要猜测，请直接说你不知道。\n"
            .. "- 如果需要澄清以提供更好的答案，请提出问题。\n"
            .. "- 从最基本的原则一步一步深入思考。\n"
            .. "- 使用苏格拉底式方法来提高你的思维和编码技能。\n"
            .. "- 如果答案需要编写代码，请不要省略任何代码。\n"
            .. "- 深呼吸；你能行的！\n",
        },
        {
          name = "ChatGPT3-5",
        },
        {
          name = "CodeGPT4",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are an AI working as a code editor.\n\n"
            .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
            .. "START AND END YOUR ANSWER WITH:\n\n```",
        },
        {
          name = "CodeGPT3-5",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-3.5-turbo-1106", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are an AI working as a code editor.\n\n"
            .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
            .. "START AND END YOUR ANSWER WITH:\n\n```",
        },
      },
      hooks = {
        UnitTests = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
            .. "```{{filetype}}\n{{selection}}\n```\n\n"
            .. "Please respond by writing table driven unit tests for the code above."
          local agent = gp.get_command_agent()
          gp.Prompt(params, gp.Target.enew, nil, agent.model, template, agent.system_prompt)
        end,
      },
    })
  end,
}
