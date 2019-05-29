using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;

namespace RenomearBaseDeDados
{
    public static class OperatingSystem
    {
        public static bool IsWindows() =>
            RuntimeInformation.IsOSPlatform(OSPlatform.Windows);

        public static bool IsMacOS() =>
            RuntimeInformation.IsOSPlatform(OSPlatform.OSX);

        public static bool IsLinux() =>
            RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
    }

    public static class Shell
    {
        public static string Bash(this string cmd)
        {
            var escapedArgs = cmd.Replace("\"", "\\\"");
            string result = Run("/bin/bash", $"-c \"{escapedArgs}\"");
            return result;
        }

        public static string Bat(this string cmd)
        {
            var escapedArgs = cmd.Replace("\"", "\\\"");
            string result = Run("cmd.exe", $"/c \"{escapedArgs}\"");
            return result;
        }

        private static string Run(string filename, string arguments)
        {
            var process = new Process()
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = filename,
                    Arguments = arguments,
                    RedirectStandardOutput = true,
                    UseShellExecute = false,
                    CreateNoWindow = false,
                }
            };
            process.Start();
            string result = process.StandardOutput.ReadToEnd();
            process.WaitForExit();
            return result;
        }
    }
    //public static class Clipboard
    //{
    //    public static void Copy(string val)
    //    {
    //        if (OperatingSystem.IsWindows())
    //        {
    //            $"echo {val} | clip".Bat();
    //        }

    //        if (OperatingSystem.IsMacOS())
    //        {
    //            $"echo \"{val}\" | pbcopy".Bash();
    //        }
    //    }
    //}
}
