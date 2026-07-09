#include <iostream>
#include <erl_nif.h>

// Parameters: num1, num2
static ERL_NIF_TERM sum_numbers_nif(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
{
  if (argc != 2)
  {
    return enif_make_badarg(env);
  }

  int num1, num2, result;

  if (enif_get_int(env, argv[0], &num1) == 0)
  {
    return enif_make_badarg(env);
  }

  if (enif_get_int(env, argv[1], &num2) == 0)
  {
    return enif_make_badarg(env);
  }

  result = num1 + num2;

  std::cout << "Numbers added in C++ successfully!" << std::endl;

  return enif_make_int(env, result);
}

static ErlNifFunc nif_funcs[] = {
    {.name = "sum_numbers_nif", .arity = 2, .fptr = sum_numbers_nif, .flags = 0}
};

ERL_NIF_INIT(Elixir.Backend1, nif_funcs, NULL, NULL, NULL, NULL)