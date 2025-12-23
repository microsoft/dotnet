```diff
 namespace System {
     public static class AppContext {
+        public static string TargetFrameworkName { get; }
+        public static object GetData(string name);
     }
+    public static class TupleExtensions {
+        public static void Deconstruct<T1>(this Tuple<T1> value, out T1 item1);
+        public static void Deconstruct<T1, T2>(this Tuple<T1, T2> value, out T1 item1, out T2 item2);
+        public static void Deconstruct<T1, T2, T3>(this Tuple<T1, T2, T3> value, out T1 item1, out T2 item2, out T3 item3);
+        public static void Deconstruct<T1, T2, T3, T4>(this Tuple<T1, T2, T3, T4> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4);
+        public static void Deconstruct<T1, T2, T3, T4, T5>(this Tuple<T1, T2, T3, T4, T5> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6>(this Tuple<T1, T2, T3, T4, T5, T6> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7>(this Tuple<T1, T2, T3, T4, T5, T6, T7> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16, out T17 item17);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16, out T17 item17, out T18 item18);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16, out T17 item17, out T18 item18, out T19 item19);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16, out T17 item17, out T18 item18, out T19 item19, out T20 item20);
+        public static void Deconstruct<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20, T21>>> value, out T1 item1, out T2 item2, out T3 item3, out T4 item4, out T5 item5, out T6 item6, out T7 item7, out T8 item8, out T9 item9, out T10 item10, out T11 item11, out T12 item12, out T13 item13, out T14 item14, out T15 item15, out T16 item16, out T17 item17, out T18 item18, out T19 item19, out T20 item20, out T21 item21);
+        public static Tuple<T1> ToTuple<T1>(this ValueTuple<T1> value);
+        public static Tuple<T1, T2> ToTuple<T1, T2>(this ValueTuple<T1, T2> value);
+        public static Tuple<T1, T2, T3> ToTuple<T1, T2, T3>(this ValueTuple<T1, T2, T3> value);
+        public static Tuple<T1, T2, T3, T4> ToTuple<T1, T2, T3, T4>(this ValueTuple<T1, T2, T3, T4> value);
+        public static Tuple<T1, T2, T3, T4, T5> ToTuple<T1, T2, T3, T4, T5>(this ValueTuple<T1, T2, T3, T4, T5> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6> ToTuple<T1, T2, T3, T4, T5, T6>(this ValueTuple<T1, T2, T3, T4, T5, T6> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7> ToTuple<T1, T2, T3, T4, T5, T6, T7>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19, T20>>> value);
+        public static Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20, T21>>> ToTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21>(this ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19, T20, T21>>> value);
+        public static ValueTuple<T1> ToValueTuple<T1>(this Tuple<T1> value);
+        public static ValueTuple<T1, T2> ToValueTuple<T1, T2>(this Tuple<T1, T2> value);
+        public static ValueTuple<T1, T2, T3> ToValueTuple<T1, T2, T3>(this Tuple<T1, T2, T3> value);
+        public static ValueTuple<T1, T2, T3, T4> ToValueTuple<T1, T2, T3, T4>(this Tuple<T1, T2, T3, T4> value);
+        public static ValueTuple<T1, T2, T3, T4, T5> ToValueTuple<T1, T2, T3, T4, T5>(this Tuple<T1, T2, T3, T4, T5> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6> ToValueTuple<T1, T2, T3, T4, T5, T6>(this Tuple<T1, T2, T3, T4, T5, T6> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7> ToValueTuple<T1, T2, T3, T4, T5, T6, T7>(this Tuple<T1, T2, T3, T4, T5, T6, T7> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19, T20>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20>>> value);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8, T9, T10, T11, T12, T13, T14, ValueTuple<T15, T16, T17, T18, T19, T20, T21>>> ToValueTuple<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21>(this Tuple<T1, T2, T3, T4, T5, T6, T7, Tuple<T8, T9, T10, T11, T12, T13, T14, Tuple<T15, T16, T17, T18, T19, T20, T21>>> value);
+    }
+    public struct ValueTuple : IComparable, IComparable<ValueTuple>, IEquatable<ValueTuple>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public int CompareTo(ValueTuple other);
+        public static ValueTuple<T1> Create<T1>(T1 item1);
+        public static ValueTuple<T1, T2> Create<T1, T2>(T1 item1, T2 item2);
+        public static ValueTuple<T1, T2, T3> Create<T1, T2, T3>(T1 item1, T2 item2, T3 item3);
+        public static ValueTuple<T1, T2, T3, T4> Create<T1, T2, T3, T4>(T1 item1, T2 item2, T3 item3, T4 item4);
+        public static ValueTuple<T1, T2, T3, T4, T5> Create<T1, T2, T3, T4, T5>(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6> Create<T1, T2, T3, T4, T5, T6>(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7> Create<T1, T2, T3, T4, T5, T6, T7>(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7);
+        public static ValueTuple<T1, T2, T3, T4, T5, T6, T7, ValueTuple<T8>> Create<T1, T2, T3, T4, T5, T6, T7, T8>(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7, T8 item8);
+        public static ValueTuple Create();
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1> : IComparable, IComparable<ValueTuple<T1>>, IEquatable<ValueTuple<T1>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public ValueTuple(T1 item1);
+        public int CompareTo(ValueTuple<T1> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2> : IComparable, IComparable<ValueTuple<T1, T2>>, IEquatable<ValueTuple<T1, T2>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public ValueTuple(T1 item1, T2 item2);
+        public int CompareTo(ValueTuple<T1, T2> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3> : IComparable, IComparable<ValueTuple<T1, T2, T3>>, IEquatable<ValueTuple<T1, T2, T3>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public ValueTuple(T1 item1, T2 item2, T3 item3);
+        public int CompareTo(ValueTuple<T1, T2, T3> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3, T4> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4>>, IEquatable<ValueTuple<T1, T2, T3, T4>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public T4 Item4;
+        public ValueTuple(T1 item1, T2 item2, T3 item3, T4 item4);
+        public int CompareTo(ValueTuple<T1, T2, T3, T4> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3, T4> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3, T4, T5> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public T4 Item4;
+        public T5 Item5;
+        public ValueTuple(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5);
+        public int CompareTo(ValueTuple<T1, T2, T3, T4, T5> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3, T4, T5> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public T4 Item4;
+        public T5 Item5;
+        public T6 Item6;
+        public ValueTuple(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6);
+        public int CompareTo(ValueTuple<T1, T2, T3, T4, T5, T6> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3, T4, T5, T6> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7>>, IStructuralComparable, IStructuralEquatable, ITupleInternal {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public T4 Item4;
+        public T5 Item5;
+        public T6 Item6;
+        public T7 Item7;
+        public ValueTuple(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7);
+        public int CompareTo(ValueTuple<T1, T2, T3, T4, T5, T6, T7> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3, T4, T5, T6, T7> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
+    public struct ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest> : IComparable, IComparable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IEquatable<ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest>>, IStructuralComparable, IStructuralEquatable, ITupleInternal where TRest : struct {
+        public T1 Item1;
+        public T2 Item2;
+        public T3 Item3;
+        public T4 Item4;
+        public T5 Item5;
+        public T6 Item6;
+        public T7 Item7;
+        public TRest Rest;
+        public ValueTuple(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7, TRest rest);
+        public int CompareTo(ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest> other);
+        public override bool Equals(object obj);
+        public bool Equals(ValueTuple<T1, T2, T3, T4, T5, T6, T7, TRest> other);
+        public override int GetHashCode();
+        int System.Collections.IStructuralComparable.CompareTo(object other, IComparer comparer);
+        bool System.Collections.IStructuralEquatable.Equals(object other, IEqualityComparer comparer);
+        int System.Collections.IStructuralEquatable.GetHashCode(IEqualityComparer comparer);
+        int System.IComparable.CompareTo(object other);
+        public override string ToString();
+    }
 }
 namespace System.Diagnostics.Tracing {
     public class EventListener : IDisposable {
-        protected static int EventSourceIndex(EventSource eventSource);
+        public static int EventSourceIndex(EventSource eventSource);
     }
 }
 namespace System.IO {
     public sealed class DirectoryInfo : FileSystemInfo {
+        public override string FullName { get; }
     }
 }
 namespace System.Net {
     public enum SecurityProtocolType {
+        SystemDefault = 0,
     }
 }
 namespace System.Net.Security {
     public class SslStream : AuthenticatedStream {
+        public virtual void AuthenticateAsClient(string targetHost, X509CertificateCollection clientCertificates, bool checkCertificateRevocation);
+        public virtual Task AuthenticateAsClientAsync(string targetHost, X509CertificateCollection clientCertificates, bool checkCertificateRevocation);
+        public virtual void AuthenticateAsServer(X509Certificate serverCertificate, bool clientCertificateRequired, bool checkCertificateRevocation);
+        public virtual Task AuthenticateAsServerAsync(X509Certificate serverCertificate, bool clientCertificateRequired, bool checkCertificateRevocation);
+        public virtual IAsyncResult BeginAuthenticateAsClient(string targetHost, X509CertificateCollection clientCertificates, bool checkCertificateRevocation, AsyncCallback asyncCallback, object asyncState);
+        public virtual IAsyncResult BeginAuthenticateAsServer(X509Certificate serverCertificate, bool clientCertificateRequired, bool checkCertificateRevocation, AsyncCallback asyncCallback, object asyncState);
+        public virtual Task ShutdownAsync();
     }
 }
 namespace System.Runtime.Caching {
     public class MemoryCache : ObjectCache, IDisposable, IEnumerable {
+        public MemoryCache(string name, NameValueCollection config, bool ignoreConfigSection);
+        public long GetLastSize(string regionName=null);
+        public object Remove(string key, CacheEntryRemovedReason reason, string regionName=null);
     }
 }
 namespace System.Runtime.CompilerServices {
+    public sealed class TupleElementNamesAttribute : Attribute {
+        public TupleElementNamesAttribute(string[] transformNames);
+        public IList<string> TransformNames { get; }
+    }
 }
 namespace System.Runtime.InteropServices {
     public enum UnmanagedType {
+        LPUTF8Str = 48,
     }
 }
 namespace System.Security.Authentication {
     public enum HashAlgorithmType {
+        Sha256 = 32780,
+        Sha384 = 32781,
+        Sha512 = 32782,
     }
 }
 namespace System.Security.Cryptography {
     public sealed class CngAlgorithm : IEquatable<CngAlgorithm> {
+        public static CngAlgorithm ECDiffieHellman { get; }
+        public static CngAlgorithm ECDsa { get; }
     }
     public sealed class CngKey : IDisposable {
-        public CngExportPolicies ExportPolicy { get; }
+        public CngExportPolicies ExportPolicy { get; internal set; }
     }
     public sealed class CngKeyBlobFormat : IEquatable<CngKeyBlobFormat> {
+        public static CngKeyBlobFormat EccFullPrivateBlob { get; }
+        public static CngKeyBlobFormat EccFullPublicBlob { get; }
     }
+    public struct ECCurve {
+        public enum ECCurveType {
+            Characteristic2 = 4,
+            Implicit = 0,
+            Named = 5,
+            PrimeMontgomery = 3,
+            PrimeShortWeierstrass = 1,
+            PrimeTwistedEdwards = 2,
+        }
+        public static class NamedCurves {
+            public static ECCurve brainpoolP160r1 { get; }
+            public static ECCurve brainpoolP160t1 { get; }
+            public static ECCurve brainpoolP192r1 { get; }
+            public static ECCurve brainpoolP192t1 { get; }
+            public static ECCurve brainpoolP224r1 { get; }
+            public static ECCurve brainpoolP224t1 { get; }
+            public static ECCurve brainpoolP256r1 { get; }
+            public static ECCurve brainpoolP256t1 { get; }
+            public static ECCurve brainpoolP320r1 { get; }
+            public static ECCurve brainpoolP320t1 { get; }
+            public static ECCurve brainpoolP384r1 { get; }
+            public static ECCurve brainpoolP384t1 { get; }
+            public static ECCurve brainpoolP512r1 { get; }
+            public static ECCurve brainpoolP512t1 { get; }
+            public static ECCurve nistP256 { get; }
+            public static ECCurve nistP384 { get; }
+            public static ECCurve nistP521 { get; }
+        }
+        public byte[] A;
+        public byte[] B;
+        public byte[] Cofactor;
+        public ECCurve.ECCurveType CurveType;
+        public ECPoint G;
+        public Nullable<HashAlgorithmName> Hash;
+        public byte[] Order;
+        public byte[] Polynomial;
+        public byte[] Prime;
+        public byte[] Seed;
+        public bool IsCharacteristic2 { get; }
+        public bool IsExplicit { get; }
+        public bool IsNamed { get; }
+        public bool IsPrime { get; }
+        public Oid Oid { get; private set; }
+        public static ECCurve CreateFromFriendlyName(string oidFriendlyName);
+        public static ECCurve CreateFromOid(Oid curveOid);
+        public static ECCurve CreateFromValue(string oidValue);
+        public void Validate();
+    }
     public abstract class ECDiffieHellman : AsymmetricAlgorithm {
+        public static ECDiffieHellman Create(ECCurve curve);
+        public static ECDiffieHellman Create(ECParameters parameters);
+        public virtual ECParameters ExportExplicitParameters(bool includePrivateParameters);
+        public virtual ECParameters ExportParameters(bool includePrivateParameters);
+        public virtual void GenerateKey(ECCurve curve);
+        public virtual void ImportParameters(ECParameters parameters);
     }
     public sealed class ECDiffieHellmanCng : ECDiffieHellman {
+        public ECDiffieHellmanCng(ECCurve curve);
+        public override ECParameters ExportExplicitParameters(bool includePrivateParameters);
+        public override ECParameters ExportParameters(bool includePrivateParameters);
+        public override void GenerateKey(ECCurve curve);
+        public override void ImportParameters(ECParameters parameters);
     }
     public sealed class ECDiffieHellmanCngPublicKey : ECDiffieHellmanPublicKey {
+        public override ECParameters ExportExplicitParameters();
+        public override ECParameters ExportParameters();
     }
     public abstract class ECDiffieHellmanPublicKey : IDisposable {
+        protected ECDiffieHellmanPublicKey();
+        public virtual ECParameters ExportExplicitParameters();
+        public virtual ECParameters ExportParameters();
     }
     public abstract class ECDsa : AsymmetricAlgorithm {
+        public static ECDsa Create(ECCurve curve);
+        public static ECDsa Create(ECParameters parameters);
+        public virtual ECParameters ExportExplicitParameters(bool includePrivateParameters);
+        public virtual ECParameters ExportParameters(bool includePrivateParameters);
+        public virtual void GenerateKey(ECCurve curve);
+        public virtual void ImportParameters(ECParameters parameters);
     }
     public sealed class ECDsaCng : ECDsa {
+        public ECDsaCng(ECCurve curve);
+        public override ECParameters ExportExplicitParameters(bool includePrivateParameters);
+        public override ECParameters ExportParameters(bool includePrivateParameters);
+        public override void GenerateKey(ECCurve curve);
+        public override void ImportParameters(ECParameters parameters);
     }
+    public struct ECParameters {
+        public ECCurve Curve;
+        public byte[] D;
+        public ECPoint Q;
+        public void Validate();
+    }
+    public struct ECPoint {
+        public byte[] X;
+        public byte[] Y;
+    }
 }
 namespace System.Text.RegularExpressions {
     public class Group : Capture {
+        public string Name { get; }
     }
 }
 namespace System.Web.Caching {
-    public sealed class AggregateCacheDependency : CacheDependency, ICacheDependencyChanged {
+    public sealed class AggregateCacheDependency : CacheDependency {
     }
     public class CacheDependency : IDisposable {
+        public void ItemRemoved();
+        public void KeepDependenciesAlive();
+        public void SetCacheDependencyChanged(Action<object, EventArgs> dependencyChangedAction);
+        public bool TakeOwnership();
     }
+    public class CacheInsertOptions {
+        public CacheInsertOptions();
+        public DateTime AbsoluteExpiration { get; set; }
+        public CacheDependency Dependencies { get; set; }
+        public CacheItemRemovedCallback OnRemovedCallback { get; set; }
+        public CacheItemPriority Priority { get; set; }
+        public TimeSpan SlidingExpiration { get; set; }
+    }
+    public abstract class CacheStoreProvider : ProviderBase, IDisposable {
+        protected CacheStoreProvider();
+        public abstract long ItemCount { get; }
+        public abstract long SizeInBytes { get; }
+        public abstract object Add(string key, object item, CacheInsertOptions options);
+        public abstract bool AddDependent(string key, CacheDependency dependency, out DateTime utcLastUpdated);
+        public abstract void Dispose();
+        public abstract object Get(string key);
+        public abstract IDictionaryEnumerator GetEnumerator();
+        public abstract void Initialize(string name, NameValueCollection config);
+        public abstract void Insert(string key, object item, CacheInsertOptions options);
+        public abstract object Remove(string key);
+        public abstract object Remove(string key, CacheItemRemovedReason reason);
+        public abstract void RemoveDependent(string key, CacheDependency dependency);
+        public abstract long Trim(int percent);
+    }
     public static class OutputCacheUtility {
+        public static void FlushKernelCache(string cacheKey);
     }
 }
 namespace System.Web.Configuration {
     public sealed class CacheSection : ConfigurationSection {
+        public string DefaultProvider { get; set; }
+        public ProviderSettingsCollection Providers { get; }
     }
 }
 namespace System.Web.Hosting {
+    public sealed class ApplicationMonitors {
+        public IApplicationMonitor MemoryMonitor { get; set; }
+    }
+    public sealed class AspNetMemoryMonitor : IApplicationMonitor, IDisposable, IObservable<LowPhysicalMemoryInfo>, IObservable<RecycleLimitInfo> {
+        public IObserver<LowPhysicalMemoryInfo> DefaultLowPhysicalMemoryObserver { get; set; }
+        public IObserver<RecycleLimitInfo> DefaultRecycleLimitObserver { get; set; }
+        public void Dispose();
+        public void Start();
+        public void Stop();
+        public IDisposable Subscribe(IObserver<RecycleLimitInfo> observer);
+        public IDisposable Subscribe(IObserver<LowPhysicalMemoryInfo> observer);
+    }
     public sealed class HostingEnvironment : MarshalByRefObject {
+        public static ApplicationMonitors ApplicationMonitors { get; }
     }
+    public interface IApplicationMonitor : IDisposable {
+        void Start();
+        void Stop();
+    }
+    public sealed class LowPhysicalMemoryInfo {
+        public LowPhysicalMemoryInfo(int currentPercentUsed, int percentLimit);
+        public int CurrentPercentUsed { get; }
+        public int PercentLimit { get; }
+        public bool RequestGC { get; set; }
+    }
+    public class LowPhysicalMemoryObserver : IObserver<LowPhysicalMemoryInfo> {
+        public LowPhysicalMemoryObserver();
+        public void OnCompleted();
+        public void OnError(Exception error);
+        public void OnNext(LowPhysicalMemoryInfo lowMemoryInfo);
+    }
+    public sealed class RecycleLimitInfo {
+        public RecycleLimitInfo(long currentPrivateBytes, long recycleLimit, RecycleLimitNotificationFrequency recycleLimitNearFrequency);
+        public long CurrentPrivateBytes { get; }
+        public long RecycleLimit { get; }
+        public bool RequestGC { get; set; }
+        public RecycleLimitNotificationFrequency TrimFrequency { get; }
+    }
+    public class RecycleLimitMonitor : MarshalByRefObject {
+        public class RecycleLimitMonitorSingleton : MarshalByRefObject {
+            public void Dispose();
+            public static void EnsureCreated();
+            public override object InitializeLifetimeService();
+            public void RegisterProxyAndStart(RecycleLimitMonitor proxy, string applicationID);
+            public void UnregisterProxyAndStop(RecycleLimitMonitor proxy);
+        }
+        public void Dispose();
+        public override object InitializeLifetimeService();
+    }
+    public enum RecycleLimitNotificationFrequency {
+        High = 0,
+        Low = 2,
+        Medium = 1,
+    }
+    public class RecycleLimitObserver : IObserver<RecycleLimitInfo> {
+        public RecycleLimitObserver();
+        public void OnCompleted();
+        public void OnError(Exception error);
+        public void OnNext(RecycleLimitInfo recycleLimitInfo);
+    }
 }
 namespace System.Windows.Forms {
     public class Control : Component, IArrangedElement, IBindableComponent, IComponent, IDisposable, IDropTarget, ISynchronizeInvoke, IWin32Window {
+        public int DeviceDpi { get; }
+        public int LogicalToDeviceUnits(int value);
+        protected virtual void OnDpiChangedAfterParent(EventArgs e);
+        protected virtual void OnDpiChangedBeforeParent(EventArgs e);
+        protected virtual void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
+        public void ScaleBitmapLogicalToDevice(ref Bitmap logicalBitmap);
+        public event EventHandler DpiChangedAfterParent;
+        public event EventHandler DpiChangedBeforeParent;
     }
+    public sealed class DpiChangedEventArgs : CancelEventArgs {
+        public int DeviceDpiNew { get; private set; }
+        public int DeviceDpiOld { get; private set; }
+        public Rectangle SuggestedRectangle { get; private set; }
+        public override string ToString();
+    }
+    public delegate void DpiChangedEventHandler(object sender, DpiChangedEventArgs e); {
+        public DpiChangedEventHandler(object @object, IntPtr method);
+        public virtual IAsyncResult BeginInvoke(object sender, DpiChangedEventArgs e, AsyncCallback callback, object @object);
+        public virtual void EndInvoke(IAsyncResult result);
+        public virtual void Invoke(object sender, DpiChangedEventArgs e);
+    }
     public class Form : ContainerControl {
+        protected virtual void OnDpiChanged(DpiChangedEventArgs e);
+        protected virtual bool OnGetDpiScaledSize(int deviceDpiOld, int deviceDpiNew, ref Size desiredSize);
+        public event DpiChangedEventHandler DpiChanged;
     }
     public class ListBox : ListControl {
+        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
     }
     public class SystemInformation {
+        public static Size GetBorderSizeForDpi(int dpi);
+        public static int GetHorizontalScrollBarHeightForDpi(int dpi);
+        public static Font GetMenuFontForDpi(int dpi);
+        public static int GetVerticalScrollBarWidthForDpi(int dpi);
     }
     public abstract class UpDownBase : ContainerControl {
+        protected override void RescaleConstantsForDpi(int deviceDpiOld, int deviceDpiNew);
     }
 }
 namespace System.Windows.Input {
     public class StylusPointPropertyInfo : StylusPointProperty {
-        public float Resolution { get; }
+        public float Resolution { get; internal set; }
     }
     public class TabletDeviceCollection : ICollection, IEnumerable {
+        public TabletDeviceCollection();
     }
 }
+namespace System.Windows.Input.StylusWisp {
+    public class WispTabletDeviceCollection : TabletDeviceCollection
+}
 namespace System.Windows.Markup {
+    public sealed class MarkupExtensionBracketCharactersAttribute : Attribute {
+        public MarkupExtensionBracketCharactersAttribute(char openingBracket, char closingBracket);
+        public char ClosingBracket { get; }
+        public char OpeningBracket { get; }
+    }
 }
 namespace System.Windows.Xps {
     public class XpsDocumentWriter : SerializerWriter {
-        public override event WritingProgressChangedEventHandler WritingProgressChanged;
+        public virtual event WritingProgressChangedEventHandler WritingProgressChanged;
     }
 }
 namespace System.Windows.Xps.Serialization {
-    public class XpsSerializationManager : PackageSerializationManager {
+    public class XpsSerializationManager : PackageSerializationManager, IXpsSerializationManager {
     }
-    public sealed class XpsSerializationManagerAsync : XpsSerializationManager {
+    public sealed class XpsSerializationManagerAsync : XpsSerializationManager, IXpsSerializationManager, IXpsSerializationManagerAsync {
     }
 }
 namespace System.Xaml {
     public class XamlMember : IEquatable<XamlMember> {
+        public IReadOnlyDictionary<char, char> MarkupExtensionBracketCharacters { get; }
+        protected virtual IReadOnlyDictionary<char, char> LookupMarkupExtensionBracketCharacters();
     }
 }
```
