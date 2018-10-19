using System.Collections.Generic;

namespace bc_readme_gen
{
    public class Globals
    {
        public static string Framework {get; private set;} = ".NET Framework";
        public static Dictionary<string,string> Errors = new Dictionary<string, string>{
            {"BAD_ARG", "Bad argument."}
        };


    }
}
