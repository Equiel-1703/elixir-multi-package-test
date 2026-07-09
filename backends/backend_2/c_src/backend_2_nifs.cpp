#include <iostream>
#include <erl_nif.h>

// Parameters: num
static ERL_NIF_TERM do_math_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  if (argc != 1)
  {
    return enif_make_badarg(env);
  }

  int num, result;

  if (!enif_get_int(env, argv[0], &num))
  {
    return enif_make_badarg(env);
  }

  result = num * 3 + 2;
  std::cout << "[C++ NIF] The number was multiplied by 3 and 2 was added." << std::endl;

  return enif_make_int(env, result);
}

static ErlNifFunc nif_funcs[] = {
    {.name = "do_math_nif", .arity = 1, .fptr = do_math_nif, .flags = 0}
};

ERL_NIF_INIT(Elixir.Backend2, nif_funcs, NULL, NULL, NULL, NULL)