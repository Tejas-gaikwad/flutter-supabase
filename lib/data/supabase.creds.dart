import 'package:supabase/supabase.dart';

class SupaBaseCredentials {
  static const String APIKEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmY2d4bnViZnF5ZnB1aW15bWtnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEwMjc5MTQsImV4cCI6MTk4NjYwMzkxNH0.FccLlL3wjhuuuVywMhzCT1gUg-j-1203xF0Oqyv980E";
  static const String APIURL = "https://kfcgxnubfqyfpuimymkg.supabase.co";

  static SupabaseClient sbClient = SupabaseClient(APIURL, APIKEY);
}
