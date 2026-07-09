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

  if (enif_get_int(env, argv[0], &num) == 0)
  {
    return enif_make_badarg(env);
  }

  result = num * 2 + 10;
  std::cout << "[C++ NIF] The number was multiplied by 2 and 10 was added." << std::endl;

  return enif_make_int(env, result);
}

static ErlNifFunc nif_funcs[] = {
    {.name = "do_math_nif", .arity = 1, .fptr = do_math_nif, .flags = 0}
};

ERL_NIF_INIT(Elixir.Backend1, nif_funcs, NULL, NULL, NULL, NULL)